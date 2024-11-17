#!/usr/bin/env zsh

source ./util.zsh

local ssh_type='ed25519'
local ssh_key_path="$HOME/.ssh/id_$ssh_type"
local ssh_config_path="$HOME/.ssh/config"

function init_ssh_key() {
	if [[ -f $ssh_key_path ]]; then
		print_skip_msg "Generate SSH Key"
		return 0
	fi

	ssh-keygen -t ed25519 -f "$ssh_key_path"

	if [[ -f "$ssh_key_path.pub" ]]; then
		local pubkey=`cat "${ssh_key_path}.pub"`
		echo ""
		print_todo_msg "Register SSH public key to GitHub account for both authentication key and signing key types"
		echo "Pubkey:"
		echo "	$pubkey"
		print_todo_msg "Run \"ssh -T github.com\""
		print_todo_msg "Run \"gh auth login\""
		echo "[Hints]"
		echo "* Where do you use GitHub? GitHub.com"
		echo "* What is your preferred protocol for Git operations on this host? SSH"
		echo "* Upload your SSH public key to your GitHub account? <PUBLIC KEY PATH>"
		echo "* Title for your SSH key: GitHub CLI"
		echo "* How would you like to authenticate GitHub CLI? Login with a web browser"
		print_todo_msg "Run \"git remote set-url origin git@github.com:sainu/dotfiles.git\""
	fi
}

function set_to_ssh_agent() {
	if [[ ! -f "$ssh_key_path" ]]; then
		print_skip_msg "Register SSH key to SSH Agent because SSH Key not found"
		return 0
	fi

	local pubkey=`cat "${ssh_key_path}.pub"`

	if ssh-add -L | grep -q "$pubkey"; then
		print_skip_msg "Add SSH Key to SSH Agent"
		return 0
	fi

	print_run_msg "Add SSH Key to SSH Agent using Apple Keychain"
	ssh-add --apple-use-keychain $ssh_key_path
}

function init_ssh_config() {
	local ssh_config_content=`cat << EOF
Host github.com
	HostName github.com
	User git
	Port 22
	AddKeysToAgent yes
	UseKeychain yes
	IdentityFile $ssh_key_path
EOF`

	if [[ -f $ssh_config_path ]]; then
		print_skip_msg "Create SSH Config"
		return 0
	fi

	print_create_msg $ssh_config_path
	echo $ssh_config_content > $ssh_config_path
}

echo "* SSH Key Path: $ssh_key_path"
echo "* SSH Config Path: $ssh_config_path"

init_ssh_key
set_to_ssh_agent
init_ssh_config
