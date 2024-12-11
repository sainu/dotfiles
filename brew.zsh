#!/usr/bin/env zsh

source ./util.zsh

# Install command-line tools using Homebrew.

function brew_install_if_missing() {
  if [[ -z "$1" ]]; then
    echo "Usage: brew_install_if_missing <package_name>"
    return 1
  fi

  local package=$1

  if brew list --formula | grep -q "^$package\$"; then
    print_skip_msg "$package"
  else
    print_install_msg "$package"
    brew install "$package"
    if [[ $? -eq 0 ]]; then
      print_success_msg "$package has been successfully installed."
    else
      print_failed_msg "Failed to install $package"
    fi
  fi
}

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Alternatives made with Rust
brew_install_if_missing bat # cat alternative
brew_install_if_missing fd # find alternative. Used by telescope.nvim

brew_install_if_missing font-hack-nerd-font
brew_install_if_missing fzf # Fuzzy find history and neovim
brew_install_if_missing gh
brew_install_if_missing git # Use the latest version
brew_install_if_missing gnupg
brew_install_if_missing grep # Use the latest version
brew_install_if_missing lazygit # Rich TUI for Git commands
brew_install_if_missing mas # CLI for Mac App Store
brew_install_if_missing neovim
brew_install_if_missing ripgrep # Required by telescope.nvim
brew_install_if_missing sheldon # Zsh Plugin Manager
brew_install_if_missing sqlite # Use the latest version, required by telescope-all-recent
brew_install_if_missing tree
brew_install_if_missing tmux
brew_install_if_missing vim # Use the latest version
brew_install_if_missing wget
brew_install_if_missing zsh # Use the latest version

# Switch to using brew-installed zsh as default shell
BREW_PREFIX=$(brew --prefix)
if ! grep -Fq "${BREW_PREFIX}/bin/zsh" /etc/shells; then
  echo "${BREW_PREFIX}/bin/zsh" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/zsh";
fi;

# Remove outdated versions from the cellar.
brew cleanup
