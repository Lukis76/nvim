# Docker my nvim

***comando de construccion de la imagen docker***

```bash
sudo docker build -t my-nvim .
```

***comando para levantar el contenedor***

```bash
sudo docker run -it my-nvim
```

### structura de carpetas
```bash
    nvim
    ├── Dockerfile
    ├── dockerig
    ├── init.lua
    ├── lazy-lock.json
    ├── lua
    │   ├── lucas
    │   │   ├── default.lua
    │   │   ├── icons.lua
    │   │   ├── lazy.lua
    │   │   ├── mapping.lua
    │   │   ├── options.lua
    │   │   └── snippets
    │   │       └── typescriptreact.lua
    │   ├── plugins
    │   │   ├── autosave
    │   │   │   ├── config.lua
    │   │   │   └── init.lua
    │   │   ├── bufferLine.lua
    │   │   ├── cmp
    │   │   │   ├── config.lua
    │   │   │   └── init.lua
    │   │   ├── colorizer.lua
    │   │   ├── colorSchema.lua
    │   │   ├── comment.lua
    │   │   ├── dashboard
    │   │   │   ├── config.lua
    │   │   │   └── init.lua
    │   │   ├── devicons.lua
    │   │   ├── dressing.lua
    │   │   ├── harpoon.lua
    │   │   ├── icon-picker.lua
    │   │   ├── indentblankline
    │   │   │   ├── config.lua
    │   │   │   └── init.lua
    │   │   ├── lsp
    │   │   │   ├── config.lua
    │   │   │   └── init.lua
    │   │   ├── lualine
    │   │   │   ├── config.lua
    │   │   │   └── init.lua
    │   │   ├── luasnip.lua
    │   │   ├── mini-ai.lua
    │   │   ├── mini-pairs.lua
    │   │   ├── min-surround.lua
    │   │   ├── navic
    │   │   │   ├── config.lua
    │   │   │   └── init.lua
    │   │   ├── noice
    │   │   │   ├── config.lua
    │   │   │   └── init.lua
    │   │   ├── notify
    │   │   │   ├── config.lua
    │   │   │   └── init.lua
    │   │   ├── project
    │   │   │   ├── config.lua
    │   │   │   └── init.lua
    │   │   ├── refactoring.lua
    │   │   ├── rest
    │   │   │   ├── config.lua
    │   │   │   └── init.lua
    │   │   ├── smart-splits.lua
    │   │   ├── smoothcursor
    │   │   │   ├── config.lua
    │   │   │   └── init.lua
    │   │   ├── telescope
    │   │   │   ├── config.lua
    │   │   │   └── init.lua
    │   │   ├── todocomments
    │   │   │   ├── config.lua
    │   │   │   └── init.lua
    │   │   ├── toggleterm
    │   │   │   ├── config.lua
    │   │   │   └── init.lua
    │   │   ├── tree
    │   │   │   ├── config.lua
    │   │   │   └── init.lua
    │   │   ├── treesitter
    │   │   │   ├── config.lua
    │   │   │   └── init.lua
    │   │   ├── trouble.lua
    │   │   └── whichkey
    │   │       ├── config.lua
    │   │       └── init.lua
    │   └── utils
    │       ├── global.lua
    │       └── init.lua
    ├── project_nvim
    │   └── project_history
    └── README.md
```


# **Guie pricipiantes**

> trabajaremos la guia en system unix en este caso ubuntu ya que el mismo se aplicara a la mayoria de usuarios

> trabajaremos por completo de la terminal hgaci que ten tu terminal a mano


para arrancar nos posicionaremos en un punto donde todos devemos arrancar y est instalando neovim
para ello ejecutaremos los el siguiente comando

```bash
sudo apt-get update && \
sudo add-apt-repository --yes ppa:neovim-ppa/unstable && \
sudo apt-get update && \
sudo apt-get install -y neovim
```

este comando en ubuntu se nos vedera intalar nvim 0.10.0 a la fecha actual

> ejecuta el sigiente condo para ver la version y asergurarte que se intalo todo correctamente

```bash
nvim --version
```

> devera devolverte algo como lo siguinte

```bash
NVIM v0.10.0-dev
Build type: RelWithDebInfo
LuaJIT 2.1.0-beta3
Compilation: /usr/bin/cc -O2 -g -Og -g -Wall -Wextra -pedantic -Wno-unused-parameter -Wstrict-prototypes -std=gnu99 -Wshadow -Wconversion -Wvla -Wdouble-promotion -Wmissing-noreturn -Wmissing-format-attribute -Wmissing-prototypes -fno-common -Wno-unused-result -Wimplicit-fallthrough -fdiagnostics-color=auto -fstack-protector-strong -DUNIT_TESTING -DINCLUDE_GENERATED_DECLARATIONS -D_GNU_SOURCE -I/usr/include/luajit-2.1 -I/usr/include -I/build/neovim-oMPnlB/neovim-0.10.0~ubuntu1+git202304172018-9e5f9c25d-9b397864c/.deps/usr/include -I/build/neovim-oMPnlB/neovim-0.10.0~ubuntu1+git202304172018-9e5f9c25d-9b397864c/build/src/nvim/auto -I/build/neovim-oMPnlB/neovim-0.10.0~ubuntu1+git202304172018-9e5f9c25d-9b397864c/build/include -I/build/neovim-oMPnlB/neovim-0.10.0~ubuntu1+git202304172018-9e5f9c25d-9b397864c/build/cmake.config -I/build/neovim-oMPnlB/neovim-0.10.0~ubuntu1+git202304172018-9e5f9c25d-9b397864c/src -I/usr/include -I/build/neovim-oMPnlB/neovim-0.10.0~ubuntu1+git202304172018-9e5f9c25d-9b397864c/.deps/usr/include -I/build/neovim-oMPnlB/neovim-0.10.0~ubuntu1+git202304172018-9e5f9c25d-9b397864c/.deps/usr/include -I/build/neovim-oMPnlB/neovim-0.10.0~ubuntu1+git202304172018-9e5f9c25d-9b397864c/.deps/usr/include -I/build/neovim-oMPnlB/neovim-0.10.0~ubuntu1+git202304172018-9e5f9c25d-9b397864c/.deps/usr/include -I/build/neovim-oMPnlB/neovim-0.10.0~ubuntu1+git202304172018-9e5f9c25d-9b397864c/.deps/usr/include -I/build/neovim-oMPnlB/neovim-0.10.0~ubuntu1+git202304172018-9e5f9c25d-9b397864c/.deps/usr/include

     archivo "vimrc" del sistema: "$VIM/sysinit.vim"
            predefinido para $VIM: "/usr/share/nvim"

Run :checkhealth for more info

```

una ves echo todo esto ahora sy a lo que vinimos

creamos loa directorios basicos nesesarios
con el siguinte comando

> donde estan los "???" colocas tu nombre o user es a gusto de cada uno

```bash
mkdir -p ~/.config/nvim/lua/???
```



nos posoicionamos en el path relativo o como se diga del systema
con el siguiente comando

```bash
cd ~/
```

creamos los 
















