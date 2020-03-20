FROM python:3.7-slim-buster
ENV PATH $PATH:/emsdk-master:/emsdk-master/upstream/emscripten:/emsdk-master/node/12.9.1_64bit/bin
RUN apt-get update \
    && apt-get -y install curl xz-utils bzip2 \
    && curl -L https://github.com/emscripten-core/emsdk/archive/master.tar.gz | tar xvz \
    && cd emsdk-master \
    && ./emsdk install latest \
    && ./emsdk activate latest \
    && emcc \
    && embuilder.py build libcompiler_rt libc-wasm libdlmalloc libpthread_stub libc_rt_wasm libsockets 
WORKDIR /workdir