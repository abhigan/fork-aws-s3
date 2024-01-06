FROM amazon/aws-cli:latest

LABEL version="1.0.0"

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
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
