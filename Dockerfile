FROM ubuntu:20.04

ARG BUILD_DATE
ARG HPOOL_VERSION
ARG DOCKER_VERSION
LABEL build_version="Hpool Miner Version:- ${HPOOL_VERSION} Docker Version:- ${DOCKER_VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="CDPro"

WORKDIR /hpool

RUN mkdir -p /hpool /plots

RUN apt update \
        && apt update \
        && apt install zip unzip curl wget git -y

RUN wget -O /hpool/miner.zip https://github.com/hpool-dev/chia-miner/releases/download/v1.2.0-5/HPool-Miner-chia-v1.2.0-5-linux.zip \
	&& wget -O /hpool/ploter.zip https://github.com/hpool-dev/chia-plotter/releases/download/v0.11/chia-plotter-v0.11-x86_64-linux-gnu.zip \
    && unzip miner.zip \
	&& unzip ploter.zip \
    && mv linux/* /hpool \
	&& mv chia-plotter/chia-plotter-linux-amd64 /hpool/plot-sign \
	&& mv hpool-miner-chia miner \
    && rm -R linux/ __MACOSX/ chia-plotter/ ploter.zip miner.zip config.yaml

CMD ["/hpool/miner"]
