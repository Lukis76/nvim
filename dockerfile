FROM ubuntu

# directorio de extraccion
WORKDIR ~/.config/nvim

RUN apt update && \
  apt upgrade -y && \ 
#  add-apt-repository ppa:neovim-ppa/unstable --yes && \
#  apt-get update && \
  apt-get install neovim -y && \
  nvim --version


RUN mkdir -p ~/.config/nvim


# directorio de destino
COPY . .

# VOLUME ~/.config/nvim

# CMD nvim ~/.config/nvim 
