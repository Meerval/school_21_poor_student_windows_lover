FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    build-essential \
    clang \
    clang-format \
    cmake \
    dos2unix \
    valgrind \
    gdb \
    lldb \
    cppcheck \
    git \
	sudo \
    locales && \
    locale-gen ru_RU.UTF-8 && \
    update-locale LANG=ru_RU.UTF-8 && \
    useradd -m -s /bin/bash ashaclem && \
    echo "ashaclem ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

ENV LC_ALL=ru_RU.UTF-8
ENV LANG=ru_RU.UTF-8
ENV LANGUAGE=ru_RU:en

USER ashaclem
WORKDIR /home/ashaclem/s21

ENTRYPOINT ["/bin/bash", "-c"]
CMD ["find . -type f \( -iname "*.sh" -o -iname "*.c" -o -iname "*.h" -o -iname "*.yml" -o -iname "Dockerfile"-o -iname "Makefile" \) -exec dos2unix -q {} + && exec /bin/bash"]