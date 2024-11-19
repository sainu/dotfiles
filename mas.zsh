#!/usr/bin/env zsh

source ./util.zsh

# Require `mas` command to execute this.

function has_app() {
  local app_id=$1
  mas list | grep -q "^$app_id"
  return $?
}

UNINSTALL_APPS=(
  408981434 # iMovie
  409183694 # Keynote
  409201541 # Pages
  409203825 # Numbers
  682658836 # GarageBand
)

echo "=== Uninstall some default apps"
for app_id in "${UNINSTALL_APPS[@]}"; do
  if has_app $app_id; then
    print_uninstall_msg "ID: $app_id"
    sudo mas uninstall "$app_id"
    if [[ $? -eq 0 ]]; then
      print_success_msg "Uninstalled ID: $app_id"
    else
      print_failed_msg "Failed to uninstall ID: $app_id"
    fi
  else
    print_skip_msg "ID: $app_id is already uninstalled"
  fi
done

INSTALL_APPS=(
  539883307 # LINE
)

echo "=== Install my favorite apps"
for app_id in "${INSTALL_APPS[@]}"; do
  if has_app $app_id; then
    print_skip_msg "ID: $app_id "
  else
    print_install_msg "ID: $app_id"
    mas install "$app_id"
    if [[ $? -eq 0 ]]; then
      print_success_msg "Installed ID: $app_id"
    else
      print_failed_msg "Failed to install ID: $app_id"
    fi
  fi
done
