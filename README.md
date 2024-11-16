# Sainu's dotfiles

This dotfiles repository is for only Mac.

# Installation

## Clone dotfiles

If Command Line Tools hasn't installed in your PC, please install

```
xcode-select --install
```

```
git clone https://github.com/sainu/dotfiles.git $HOME/dotfiles && cd dotfiles
```

## Install all

`install.zsh` can run all installation scripts at once.
If you wish to install them individually, please move on to the next section.

```
source install.zsh
```

## Execute specific script

You can execute a specific script in these script files:

```
source {script name}
```

| Script name | Description |
| :-- | :-- |
| `macos.zsh` | Setup Mac-specific settings |
| `extra.zsh` | Create `.extra` file to make shell load secrets without remote push |
| `install_homebrew.zsh` | Install brew command |
| `brew.zsh` | Install Homebrew formulae |
| `cask.zsh` | Install Apps from the Homebrew Cask |
| `dotfiles.zsh` | Install the dot-files to the home directory |
| `mas.zsh` | Uninstall default Apps and install Apps from Mac App Store |
| `tmux.zsh` | Prepare for starting tmux |
| `ssh.zsh` | Set up type typical SSH config and create SSH key |

# Thanks to

* [Mathias Bynens](https://mathiasbynens.be/) and his [dotfiles repository](https://github.com/mathiasbynens/dotfiles)
* [kpango](https://kpango.com/) and his [dotfiles repository](https://github.com/kpango/dotfiles)
