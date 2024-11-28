#!/usr/bin/env zsh

source ./util.zsh

function doIt() {
  print_sync_msg "Sync dotfiles to home directory"
  rsync --exclude=".git" \
    --exclude=".gitignore" \
    --exclude="*.md" \
    --exclude="*.zsh" \
    -avh --no-perms . ~;

  echo ""
  echo "If the shell should be reloaded, please run the following command:"
  echo ""
  echo "  reload"
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
