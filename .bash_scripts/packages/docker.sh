#!/bin/bash
### _================
### - Docker (docker, docker-compose)
### _================
alias dock='cd $DOCKER_COMPOSE_PATH' # place (docker-compose.yaml) in (~/Docker)
alias sail='sudo docker compose up -d --remove-orphans' # start docker containers
alias capsize='sudo docker compose down' # stop docker containers
alias restock='sudo docker compose pull' # update docker images
alias poopdeck='docker image prune -a' # delete all unused images

port(){ # update all containers and delete old images
    dock;
    capsize;
    restock;
    sail;
}
crew(){
    case $1 in
        brig)   #_(stop container)
            sudo docker stop $2;;
        scold)  #_(restart container)
            sudo docker restart $2;;
        watch)  #_(open container terminal)
            sudo docker exec -it $2 sh;;
        health) #_(health status)
            sudo docker inspect --format "{{json .State.Health }}" $2 | jq;;
        *)  #_(status of all containers)[formated]
            sudo docker ps --format \
            "table{{.Names}}\t{{.Status}}\t{{.Ports}}\t{{.Image}}";;
    esac
}
fleet(){ # create /fleet dir in compose folder
    dock;
    local FLEET_FILES=($(for f in fleet/*; do printf -- "--file\n$f\n"; done)) # grab file names & add flag(s)
    case $1 in
        sail)   #_(launch all projects)
            sudo docker compose "${FLEET_FILES[@]}" up -d --remove-orphans;;
        capsize)
            sudo docker compose "${FLEET_FILES[@]}" down;;
        port)   #_(update all projects)
            sudo docker compose "${FLEET_FILES[@]}" down;
            sudo docker compose "${FLEET_FILES[@]}" pull;
            sudo docker compose "${FLEET_FILES[@]}" up -d --remove-orphans;
            ;;
        *)  #_(print fleet files)
            test-array FLEET_FILES;;
    esac
}
