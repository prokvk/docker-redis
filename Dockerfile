FROM smebberson/alpine-base:1.0.0
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

# Install redis
RUN echo "http://dl-4.alpinelinux.org/alpine/v3.1/main" >> /etc/apk/repositories && \
	apk add --update redis=2.8.23-r0 && \
	rm -rf /var/cache/apk/* && \
	mkdir -p /data /var/redis/6379 /etc/redis/6379 /var/log/redis && \
	chown -R redis:redis /data && \
	chown -R redis:redis /var/redis/6379 && \
	chown -R redis:redis /etc/redis/6379 && \
	touch /var/log/redis/redis_6379.log && \
	chown -R redis:redis /var/log/redis

# Add the files
ADD root /

VOLUME ["/data"]

# Expose the ports for redis
EXPOSE 6379
