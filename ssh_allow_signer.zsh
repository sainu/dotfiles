#!/usr/bin/env zsh

echo "Enter author email:"
read author_email
echo "Enter SSH Public Key:"
read ssh_public_key

local signer="$author_email namespaces=\"git\" $ssh_public_key"

local script_path="$(realpath "$0")"
local script_dir="$(dirname $script_path)"
local script_allowed_signers_path="$script_dir/.ssh/allowed_signers"

echo "[$fg[green]RUN$reset_color] Append the signer"
echo ""
echo "	$signer"
echo ""
echo $signer >> $script_allowed_signers_path

rsync -avh "$script_allowed_signers_path" "$HOME/.ssh"
