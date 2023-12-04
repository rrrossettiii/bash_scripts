#!/bin/bash
### _================
### - Docker (docker, docker-compose)
### _================
alias dock='cd $DOCKER_COMPOSE_PATH' ### place 'docker-compose.yaml' in ~/Documents/Docker
alias sail='sudo docker compose up -d --remove-orphans' ### start docker containers
alias capsize='sudo docker compose down' ### stop docker containers
alias restock='sudo docker compose pull' ### update docker images
alias poopdeck='docker image prune -a' ### delete all unused images
crew(){
    case $1 in
        brig)   ### stop container
            sudo docker stop $2;;
        scold)  ### restart container
            sudo docker restart $2;;
        order)  ### open container bash
            sudo docker exec -it $2 bash;;
        ask)  ### open container shell
            sudo docker exec -it $2 sh;;
        health) ### health status
            sudo docker inspect --format "{{json .State.Health }}" $2 | jq;;
        *)  ### status of all containers (formated)
            sudo docker ps --format \
            "table{{.Names}}\t{{.Status}}\t{{.Ports}}\t{{.Image}}";;
    esac
}
### _================
### Single docker-compose.yaml
### _================
port(){ ### update all containers and delete old images
    dock;
    restock;
    capsize;
    sail;
}
### _================
### Multiple docker-compose.yaml
### _================
### create /fleet dir in $DOCKER_COMPOSE_PATH
fleet(){
    dock;
    local FLEET_FILES=($(for f in fleet/*; do printf -- "--file\n$f\n"; done)) ### grab file names & add flag(s)
    case $1 in
        sail) ### launch all projects
            sudo docker compose "${FLEET_FILES[@]}" up -d --remove-orphans;;
        capsize) ### remove all projects
            sudo docker compose "${FLEET_FILES[@]}" down;;
        port) ### update all projects
            sudo docker compose "${FLEET_FILES[@]}" pull; ### pull first to keep downtime to a minmum.
            sudo docker compose "${FLEET_FILES[@]}" down;
            sudo docker compose "${FLEET_FILES[@]}" up -d --remove-orphans;
            ;;
        *)  ### print fleet files
            test-array FLEET_FILES;;
    esac
}
