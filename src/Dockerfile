FROM ubuntu:22.04

RUN apt update && apt install -y \
    build-essential \
    clang-format \
    cppcheck \
    valgrind \
    make

RUN apt install -y gcc-11 && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 100

RUN gcc --version

WORKDIR /src
VOLUME ["/src"]
CMD ["/bin/bash"]
