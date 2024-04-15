#!/bin/bash

# Start Redis container for GitLab
docker run -d \
  --name gitlab-redis \
  --restart always \
  redis:latest

# Start GitLab container
docker run -d \
  --name gitlab \
  --restart always \
  -p 80:80 \
  -p 443:443 \
  -p 22:22 \
  -e GITLAB_OMNIBUS_CONFIG="external_url 'http://gitlab.example.com'; gitlab_rails['gitlab_shell_ssh_port'] = 22; gitlab_rails['db_adapter'] = 'postgresql'; gitlab_rails['db_encoding'] = 'utf8'; gitlab_rails['db_collation'] = 'utf8_general_ci'; gitlab_rails['db_database'] = 'gitlabhq_production'; gitlab_rails['db_username'] = 'gitlab'; gitlab_rails['db_password'] = 'password';" \
  gitlab/gitlab-ce:latest
