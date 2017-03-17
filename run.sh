#! /bin/bash

exec /usr/bin/docker run --rm --name redis -p 6379:6379 -v /home/prokvk/dev/github/docker-redis/config:/etc/redis/6379 \
	-v /home/prokvk/dev/github/docker-redis/data:/var/redis/6379 redis
