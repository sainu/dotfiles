#!/usr/bin/env zsh

source './util.zsh'

local plug_file_path="$HOME/.vim/autoload/plug.vim"

if [[ -f $plug_file_path ]]; then
	print_skip_msg "Install vim-plug"
	return 0
fi

print_install_msg "vim-plug"
curl https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
	-o $plug_file_path \
	--create-dirs -sS

print_success_msg "vim-plug is downloaded in $$plug_file_path"
print_todo_msg "Open vim and run setup commands"
echo "  :PlugInstall"
echo "  :Copilot setup"