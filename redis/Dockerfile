FROM syso

RUN apt-get update -y &&  apt-get install -y redis-server

EXPOSE 6379

ENTRYPOINT [ "/app/bin/syso", "redis-server", "--protected-mode", "no"]
