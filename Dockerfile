FROM debian:9-slim

RUN apt-get update -qq && apt-get install -y -qq  \
    apt-transport-https \
    ca-certificates \
    sudo \
    curl \
    netcat \
    parallel

ENV STORAGEOS_ENDPOINTS=http://storageos.kube-system.svc
ENV STORAGEOS_USERNAME=storageos
ENV STORAGEOS_PASSWORD=storageos
RUN curl -sSLo storageos https://github.com/storageos/go-cli/releases/download/v2.3.0/storageos_linux_amd64 \
            && chmod +x storageos \
            && sudo mv storageos /usr/local/bin/
