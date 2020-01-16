FROM dockage/alpine:3.9-openrc

ENV SALT_VERSION=stable
ENV BOOTSTRAP_OPTS='-D'

RUN apk update && apk upgrade \
    && apk add curl \
    && mkdir -p /run/openrc && touch /run/openrc/softlevel \
    && apk add python3

RUN curl -o bootstrap-salt.sh -L https://bootstrap.saltstack.com \
    && sh bootstrap-salt.sh -U -X -d $BOOTSTRAP_OPTS $SALT_VERSION

ENTRYPOINT [ "salt-minion", "-l", "debug" ]