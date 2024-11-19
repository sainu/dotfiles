#!/usr/bin/env zsh

zsh_scripts=(
  macos.zsh
  extra.zsh
  install_homebrew.zsh
  brew.zsh
  cask.zsh
  dotfiles.zsh
  mas.zsh
  tmux.zsh
  ssh.zsh
  iterm.zsh
  nodejs.zsh
)

for zsh_script in "${zsh_scripts[@]}"; do
  local inputs=(${(s: :)zsh_script})
  local file="${inputs[1]}"
  local option="${inputs[2]}"

  if [[ $option = "" ]]; then
    echo "* Run $file"
    source "./$file"
  else
    echo "* Run $file $option"
    source "./$file" "$option"
  fi

  if [[ $? -eq 0 ]]; then
    echo ""
  else
    exit $?
  fi
done
