IMAGE = redis
NAME = redis
PORTS = -p 6379:6379
# VOLUMES = \
# 	-v $$HOME/Downloads/docker/lamp/www:/app \
# 	-v $$HOME/Downloads/docker/lamp/_mysql_data:/var/lib/mysql
	# -v $$HOME/Downloads/lamp/_mysql_logs:/usr/share/mysql

.PHONY: build run stop inspect rm logs ports

build:
		docker build -t $(IMAGE) .

run:
		docker run -d --name $(NAME) $(PORTS) $(VOLUMES) $(IMAGE)
		# docker run --rm -it --name $(NAME) $(PORTS) $(VOLUMES) $(IMAGE) bash

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