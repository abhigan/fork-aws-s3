FROM alpine:latest

LABEL version="1.0.0"

# https://tecadmin.net/awscli-in-an-alpine-dockerfile/
RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
        python3 \
        py3-pip  && \
    pip3 install --upgrade pip --break-system-packages && \
    pip3 install --no-cache-dir awscli --break-system-packages && \
    rm -rf /var/cache/apk/*

RUN apk add --no-cache \
    nodejs \
    npm \
    git \
    openssl \
    openssh-client \
    autoconf \
    automake \
    bash \
    g++ \
    libc6-compat \
    libjpeg-turbo-dev \
    libpng-dev \
    make \
    nasm
# We need these deps for git and docusaurus

ADD --chmod=777 entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
