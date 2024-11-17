#!/usr/bin/env zsh

autoload -Uz colors;
colors

function print_success_msg() {
	echo "[$fg[green]SUCCESS$reset_color] $1"
}

function print_failed_msg() {
	echo "[$fg[red]FAILED$reset_color] $1"
}

function print_warn_msg() {
	echo "[$fg[yellow]WARN$reset_color] $1"
}

function print_skip_msg() {
	echo "[$fg[green]SKIP$reset_color] $1"
}

function print_install_msg() {
	echo "[$fg[green]INSTALL$reset_color] $1"
}

function print_uninstall_msg() {
	echo "[$fg[green]UNINSTALL$reset_color] $1"
}

function print_run_msg() {
	echo "[$fg[green]RUN$reset_color] $1"
}

function print_sync_msg() {
	echo "[$fg[green]SYNC$reset_color] $1"
}

function print_create_msg() {
	echo "[$fg[green]CREATE$reset_color] $1"
}

function print_exist_msg() {
	echo "[$fg[green]EXIST$reset_color] $1"
}

function print_append_msg() {
	echo "[$fg[green]APPEND$reset_color] $1"
}

function print_todo_msg() {
	echo "[$fg[yellow]TODO$reset_color] $1"
}
