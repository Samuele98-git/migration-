#!/bin/bash

echo "Starting mattermost, redmine and gitlab......."
./gitlab.sh
docker-compose up -d
cd mattermost
sudo bash ./mattermost.sh
docker-compose up -d
cd ..
cd taiga-docker-main/taiga-docker-main
echo "Starting taiga..."
./launch-all.sh

echo "Create admin user....."
./taiga-manage.sh createsuperuser
./launch-taiga.sh
