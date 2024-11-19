#!/usr/bin/env zsh

source ./util.zsh

function doIt() {
  print_sync_msg "Sync dotfiles to home directory"
  rsync --exclude=".git" \
    --exclude=".gitignore" \
    --exclude="*.md" \
    --exclude="*.zsh" \
    -avh --no-perms . ~;

  print_run_msg "Load .zshrc"
  source ~/.zshrc;
}

if [ "$1" = "--force" -o "$1" = "-f" ]; then
  doIt;
else
  print "This may overwrite existing files in your home directory. Are you sure? (y/n) ";
  read answer
  echo ""
  if [[ $answer =~ ^[Yy]$ ]]; then
    doIt;
  fi;
fi;
unset doIt;
