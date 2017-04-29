#!/usr/bin/env sh

SCRIPT=$(readlink -f $0)
PWD=$(dirname $SCRIPT)

exec /usr/bin/docker run --rm --name redis -p 6379:6379 \
	-v $PWD/config:/etc/redis/6379 \
	-v $PWD/data:/var/redis/6379 \
	redis
