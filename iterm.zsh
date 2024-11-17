#!/usr/bin/env zsh

source './util.zsh'

local schemes=(
	Hybrid.itermcolors
)

for scheme in "${schemes[@]}"; do
	print_run_msg "Download $scheme"
	curl https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/$scheme \
		-o $HOME/Downloads/itermcolors/$scheme \
		--create-dirs -sS
done

print_success_msg "My favorite color schemes were downloaded in $HOME/Downloads/itermcolors"