#!/usr/bin/env zsh

source './util.zsh'

print_install_msg "vim-plug"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

print_todo_msg "Open vim and run setup commands"
echo "  :PlugInstall"
echo "  :Copilot setup"