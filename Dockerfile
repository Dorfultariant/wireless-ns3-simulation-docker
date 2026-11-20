FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Deps defined by the "Laboratory notes"
RUN apt-get update && apt-get install -y \
    build-essential \
    software-properties-common \
    curl \
    wget \
    git \
    vim \
    cmake \
    ninja-build \
    python3 \
    python3-pip \
    python3-venv \
    gcc-9 \
    g++-9 \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    llvm \
    libncurses5-dev \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libffi-dev \
    liblzma-dev \
    libxml2 \
    libxml2-dev \
    libgtk-3-dev \
    libboost-all-dev \
    libeigen3-dev \
    gsl-bin \
    libgsl-dev \
    libgslcblas0 \
    graphviz \
    sqlite3 \
    libsqlite3-dev \
    ccache \
    doxygen \
    tcpdump \
    && rm -rf /var/lib/apt/lists/*


# Setup for the specific python setup:
ENV PYENV_ROOT=/root/.pyenv
ENV PATH=$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH

RUN curl https://pyenv.run | bash

RUN bash -lc "\
    export PATH=\$PYENV_ROOT/bin:\$PATH && \
    eval \"\$(pyenv init -)\" && \
    pyenv install 3.6.15 && \
    pyenv virtualenv 3.6.15 py36env \
"

WORKDIR /workspace

CMD ["/bin/bash"]
