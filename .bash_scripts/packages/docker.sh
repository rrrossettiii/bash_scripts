#!/bin/bash
### _================
### - docker (docker, docker-compose)
### _================
alias dock='cd $DOCKER_COMPOSE_PATH' ### place 'docker-compose.yaml' in ~/Documents/Docker
alias sail='sudo docker compose up -d --remove-orphans' ### start docker containers
alias capsize='sudo docker compose down' ### stop docker containers
alias restock='sudo docker compose pull' ### update docker images
alias poopdeck='docker image prune -a' ### delete all unused images

port(){ ### update all & remove old (single 'docker-compose.yaml')
    dock;
    capsize;
    restock;
    sail;
}
crew(){
    case $1 in
        brig)   ### stop container
            sudo docker stop $2;;
        scold)  ### restart container
            sudo docker restart $2;;
        watch)  ### open container terminal
            sudo docker exec -it $2 sh;;
        health) ### health status
            sudo docker inspect --format "{{json .State.Health }}" $2 | jq;;
        *)  ### status of all containers (formated)
            sudo docker ps --format \
            "table{{.Names}}\t{{.Status}}\t{{.Ports}}\t{{.Image}}";;
    esac
}
fleet(){ ### create '/fleet' /dir in $DOCKER_COMPOSE_PATH ($ `mkdir $DOCKER_COMPOSE_PATH/fleet`)
    dock;
    local FLEET_FILES=($(for f in fleet/*; do printf -- "--file\n$f\n"; done)) ### grab file names & add flag(s)
    case $1 in
        sail)   ### launch all projects
            sudo docker compose "${FLEET_FILES[@]}" up -d --remove-orphans;;
        capsize)
            sudo docker compose "${FLEET_FILES[@]}" down;;
        port)   ### update all projects
            sudo docker compose "${FLEET_FILES[@]}" down;
            sudo docker compose "${FLEET_FILES[@]}" pull;
            sudo docker compose "${FLEET_FILES[@]}" up -d --remove-orphans;
            ;;
        *)  ### print fleet files
            test-array FLEET_FILES;;
    esac
}
