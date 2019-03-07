FROM alpine:latest as builder

WORKDIR /tmp

# Install dependencies
RUN apk add --no-cache \
    build-base \
    ctags \
    git \
    libx11-dev \
    libxpm-dev \
    libxt-dev \
    make \
    ncurses-dev \
    python \
    python-dev

# Build vim from git source
RUN git clone https://github.com/vim/vim \
 && cd vim \
 && ./configure \
    --disable-gui \
    --disable-netbeans \
    --enable-multibyte \
    --enable-pythoninterp \
    --with-features=big \
    --with-python-config-dir=/usr/lib/python2.7/config \
 && make install

FROM node:10-alpine

COPY --from=builder /usr/local/bin/ /usr/local/bin
COPY --from=builder /usr/local/share/vim/ /usr/local/share/vim/
# NOTE: man page is ignored

COPY bashrc.sh /root/.bashrc
COPY vimrc.vim /root/.vimrc

RUN apk add --no-cache \
    python \
    python-dev \
    cmake \
    make \
    g++ \
    diffutils \
    libice \
    libsm \
    libx11 \
    libxt \
    ncurses \
    bash \
    curl \
    wget \
    tmux \
    gnupg \
    git && \
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
    npm install -g eslint prettier && \
    vim +PluginInstall +qall 

WORKDIR /root/.vim/bundle/YouCompleteMe
RUN python install.py --ts-completer

WORKDIR /

ENTRYPOINT [ "bash" ]

