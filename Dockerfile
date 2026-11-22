FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

#
# Base packages
#
RUN apt-get update && apt-get install -y \
    sudo \
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
    make \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

#
# Dedicated development user
#
RUN groupadd ns3 && \
    useradd -m -s /bin/bash -g ns3 ns3 && \
    usermod -aG sudo ns3 && \
    echo 'ns3 ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/ns3 && \
    chmod 0440 /etc/sudoers.d/ns3

USER ns3
WORKDIR /home/ns3

#
# pyenv
#
ENV PYENV_ROOT=/home/ns3/.pyenv
ENV PATH=$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH

RUN curl https://pyenv.run | bash

#
# Python 3.6.15
#
RUN bash -lc '\
    export PYENV_ROOT=/home/ns3/.pyenv && \
    export PATH=$PYENV_ROOT/bin:$PATH && \
    eval "$(pyenv init -)" && \
    pyenv install -s 3.6.15 \
'

RUN bash -lc '\
    export PYENV_ROOT=/home/ns3/.pyenv && \
    export PATH=$PYENV_ROOT/bin:$PATH && \
    eval "$(pyenv init -)" && \
    pyenv virtualenv -f 3.6.15 py36env \
'

#
# Bash configuration
#
COPY .bashrc /home/ns3/.bashrc

COPY requirements.txt /tmp/requirements.txt

RUN bash -lc '\
    export PYENV_ROOT=/home/ns3/.pyenv && \
    export PATH=$PYENV_ROOT/bin:$PATH && \
    eval "$(pyenv init -)" && \
    eval "$(pyenv virtualenv-init -)" && \
    pyenv activate py36env && \
    pip install --upgrade pip==21.3.1 && \
    pip install -r /tmp/requirements.txt \
'

WORKDIR /workspace

CMD ["/bin/bash"]
