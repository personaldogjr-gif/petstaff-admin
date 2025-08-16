#!/bin/bash

if [[ "$1" == "--prod" ]]; then
    docker compose -f docker-compose.yml -f docker-compose.prod.yml build --build-arg APP_ENV=production
    docker compose -f docker-compose.yml -f docker-compose.prod.yml up -d
else
    docker compose build
    docker compose up
fi
