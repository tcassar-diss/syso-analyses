FROM syso

RUN apt-get update && apt-get install -y --no-install-recommends \
    nginx \
    curl \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 80

ENTRYPOINT [ "/app/bin/syso", "nginx", "-g", "daemon off;"]
