FROM python:3.7-slim-buster

RUN apt-get update \
    && apt-get -y install curl xz-utils bzip2 \
    && curl -L https://github.com/emscripten-core/emsdk/archive/master.tar.gz | tar xvz \
    && cd emsdk-master \
    && ./emsdk install latest \
    && ./emsdk activate latest
ENV PATH $PATH:/emsdk-master:/emsdk-master/upstream/emscripten:/emsdk-master/node/12.9.1_64bit/bin
WORKDIR /workdir