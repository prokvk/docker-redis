IMAGE = redis
NAME = redis
PORTS = -p 6379:6379
VOLUMES = \
	-v $$PWD/config:/etc/redis/6379 \
	-v $$PWD/data:/var/redis/6379

.PHONY: build run cli stop inspect rm logs ports up

build:
		docker build -t $(IMAGE) .

run:
		docker run -d --name $(NAME) $(PORTS) $(VOLUMES) $(IMAGE)
		# docker run --rm -it --name $(NAME) $(PORTS) $(VOLUMES) $(IMAGE)

cli:
		docker exec -it $(NAME) redis-cli

stop:
		docker stop $(NAME)
		docker rm $(NAME)

inspect:
		docker exec -it $(NAME) sh

rm:
		docker rm $(NAME)

logs:
		docker logs $(NAME)

ports:
		docker port $(NAME)

up:
		rsync -avz ./* /home/prokvk/dev/forpsi/docker-redis --exclude data