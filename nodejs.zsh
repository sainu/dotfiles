#!/usr/bin/env zsh

source './util.zsh'

print_install_msg "VOLTA to manage JavaScript"
curl https://get.volta.sh | bash -s -- --skip-setup

echo "See \".exports\" for VOLTA Configuration"

print_install_msg "the latest version of Node"
volta install node@latest