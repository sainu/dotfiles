#!/usr/bin/env zsh

source ./util.zsh

# Install apps using Homebrew Cask.
# Cask name can be got from https://formulae.brew.sh/cask

function brew_install_cask_if_missing() {
  if [[ -z "$1" ]]; then
    echo "Usage: brew_install_cask_if_missing <package_name>"
    return 1
  fi

  local package=$1

  if brew list --cask | grep -q "^$package\$"; then
    print_skip_msg "$package"
  else
    print_install_msg "$package"
    brew install --cask "$package"
    if [[ $? -eq 0 ]]; then
      print_success_msg "$package has been successfully installed."
    else
      print_failed_msg "Failed to install $package."
    fi
  fi
}

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

brew_install_cask_if_missing alfred
brew_install_cask_if_missing alt-tab
brew_install_cask_if_missing docker
brew_install_cask_if_missing google-chrome
brew_install_cask_if_missing iterm2
brew_install_cask_if_missing karabiner-elements
brew_install_cask_if_missing visual-studio-code
brew_install_cask_if_missing 1password
