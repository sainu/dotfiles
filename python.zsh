#!/usr/bin/env zsh

source './util.zsh'

print_install_msg "pyenv to manage JavaScript"
brew install pyenv

echo '' >> ~/.zshrc
echo '# pyenv' >> ~/.zshrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init - zsh)"' >> ~/.zshrc
