FROM python:3.7-slim-buster

RUN apt-get update \
    && apt-get -y install curl \
    && curl -L https://github.com/emscripten-core/emsdk/archive/master.tar.gz | tar xvz \
    && cd emsdk-master \
    && ./emsdk install latest-fastcomp \
    && ./emsdk activate latest-fastcomp
ENV PATH $PATH:/emsdk-master:/emsdk-master/fastcomp/emscripten:/emsdk-master/node/12.9.1_64bit/bin
WORKDIR /workdir