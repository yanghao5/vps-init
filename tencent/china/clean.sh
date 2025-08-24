#!/bin/bash

echo "clean"

sudo docker stop $(docker ps -q)
sudo docker system prune -a --volumes -f