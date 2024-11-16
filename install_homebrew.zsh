#!/usr/bin/env zsh

source './util.zsh'

if command -v brew &>/dev/null; then
	print_skip_msg "Install brew command"
else
	print_run_msg "Install brew command"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	print_sync_msg "Sync .zprofile to home directory"
	rsync -avh --no-perms ".zprofile" $HOME

	print_run_msg "Load .zprofile"
	source "$HOME/.zprofile"
fi
