#!/usr/bin/env zsh

export EDITOR='vi'
export LANG=ja_JP.UTF-8

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
HOMEBREW_PREFIX=$(brew --prefix)

export PATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/findutils/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/grep/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/ssh-copy-id/bin:$PATH"
