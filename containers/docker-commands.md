# Docker commands

## Overview

Docker, including docker-compse command cheet sheet for everyday use..

## Docker

* `docker run -it -p 8080:8080 --rm -v 'pwd':/src --name test test`
  * `--rm` destroy container after running docker..
  * `--name` provides name.
* `docker exec -it {container_name} bash`
  * allocate tty with bush.
* `docker run -it -p 8080:8080 test-image bash`
  * `-p` port forwarding guest:host IPs.
  * `-i` send a command to container with bash, etc..
  * `-f` specify Dockerfile.
* `docker build --no-cache=true -t test`
  * `-t` provides image name.
  * `-t` provides image name.
  * `--no-cache=true` indicates no cache
* `docker ps`
  * shows running containers
  * `-a` shows all containers including stopped containers.
* `docker images`
  * show built docker images.
* `docker rmi {image}...`
  * delete docker image\(s\).
* `docker system prune`
  * delete all unused containers, images, volumes and network.
* `docker tag {source_image[:tag]} {target_image[:tag]}`
  * attach tag to docker image.
* `docker commit {container} {image}`
  * create docker image from existing container.
* `docker pull {image[:tag]}`
  * download docker image to local.
* `docker rmi $(docker images -f "dangling=true" -q)`
  * remove all no tagged images.
* `docker volume ls -qf dangling=true | xargs docker volume rm`
  * remove all docker volumes.

## Docker Compose commands

* `docker-compose build`
  * build images and containers.
  * `--no-cache` option uses no cache.
* `docker-compose pull`
  * pull images defined in docker-compose.yml
* `docker-compose {file option} up {option}`
  * start or restart a docker service defined in docker-compose.yml
  * `-f {docker-compose.yml}` compose with specified file.
  * `-d` is a detach option. docker-compose up.
  * `--build` provides with bulding docker image.
* `docker-compose down`
  * stop service removing container and network
  * `-v --rmi all` option indicates removing volumes and docker images.
* `docker-compose exec {container_name} bash`
  * allocate tty with bush

