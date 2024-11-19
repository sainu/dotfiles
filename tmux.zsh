#!/usr/bin/env zsh

source ./util.zsh

# Prepare for starting tmux

local tpm_dir="$HOME/.tmux/plugins/tpm"

if [[ -d "$tpm_dir" ]]; then
  print_skip_msg "Install TPM"
else
  print_install_msg "Install TPM"
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
  print_todo_msg "Items to do before using tmux"
  print_todo_msg "1. Change Font of Terminal and iTerm2 to \"Hack Nerd Font Regular\""
  print_todo_msg "2. Execute \"tmux\" command"
  print_todo_msg "3. Press \"Prefix + I\" to install tmux plugins"
fi
