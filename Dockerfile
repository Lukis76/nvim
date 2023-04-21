FROM alpine:edge

run apk add \
  --no-cache \
  git \
  curl \
  build-base \
  tar\
  make \
  neovim \
  ripgrep \
  alpine-sdk \
  bash \
  python3 \
  py3-pip \
  nodejs \
  npm \
  --update

# RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y 

# ENV PATH="/root/.cargo/bin:${PATH}"

RUN mkdir -p ~/.config/nvim/ \
  && mkdir -p ~/.code \
  && mkdir -p ~/.code/plugins

# directorio de extraccion
WORKDIR /root/.config/nvim

# directorio de destino
COPY . .

VOLUME ~/.config/nvim

# CMD ["nvim"]
