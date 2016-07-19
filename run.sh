#! /bin/bash

exec /usr/bin/docker run --rm --name redis -p 6379:6379 redis