#!/usr/bin/env zsh

source './util.zsh'

print_install_msg "SDKMAN"
curl -s "https://get.sdkman.io" | bash

init_file="$HOME/.sdkman/bin/sdkman-init.sh"
print_run_msg "source $init_file"
source $init_file
