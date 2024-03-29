#!/bin/bash

set -ue



RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color
DEBUG=0
execution_mode=remote



# OSを判定
if [ $(uname) = 'Darwin' ]; then
  OS='Mac'
elif [ $(uname) = 'Linux' ]; then
  OS='Linux'
else
  echo -e "${RED}Your platform ($(uname)) is not supported.${NC}"
  exit 1
fi



while [ $# -gt 0 ];do
  case ${1} in
    --debug|-d)
      set -uex
      DEBUG=1
      ;;
    --local|-l)
      execution_mode=local
      ;;
    *)
      ;;
  esac
  shift
done



function install() {
  echo
  echo -e "${GREEN}INSTALL${NC} $1 to setup dotfiles..."
  if command_exists brew; then
    brew $1
  elif command_exists apt-get; then
    apt-get install -y --no-install-recommends $1
  fi
}


function command_exists() {
  if type $1 > /dev/null 2>&1; then
    echo -e "${GREEN}EXISTS${NC} $1"
    # 0 = true
    return 0
  else
    echo -e "${RED}NOT FOUND${NC} $1"
    # 1 = false
    return 1
  fi
}


# ========== Print execution mode ==========
echo "=========================="
if [ $execution_mode = "local" ]; then
  echo "Execution Mode: Local"
else
  echo "Execution Mode: Remote"
fi
echo "=========================="


# ========== Install dependencies ==========
echo
echo "Install dependencies"
command_exists curl || install curl
command_exists unzip || install unzip


# ========== Download dotfiles ==========
echo
tempfile=/tmp/dotfiles.zip
workspace=/tmp/dotfiles

rm -rf ${workspace} ${tempfile}

echo "Download dotfiles repository"
if [ $execution_mode = "local" ]; then
  mkdir -p ${workspace}/dotfiles-master
  cp -r ./ ${workspace}/dotfiles-master/
else
  curl -LSfs -o ${tempfile} https://github.com/sainu/dotfiles/archive/master.zip
  unzip -oq ${tempfile} -d ${workspace}
fi
echo -e "${GREEN}COMPLETE${NC} to download dotfiles"

pushd ${workspace}/dotfiles-master > /dev/null



# ========== Install package manager ==========
echo
echo "Install package manager for ${OS}"
if [ $OS = 'Mac' ]; then
  if !(command_exists brew); then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo -e "${GREEN}COMPLETE${NC} to install homebrew"
  fi
fi



# dotfilesを設置
echo
read -p "Install dotfiles? (y/n) " yn
if [ $yn = "y" -o $yn = "Y" ]; then
  dot_files=(.gitconfig .gitignore .pryrc .tmux.conf .vimrc .myzshrc.zsh
  )

  for file in ${dot_files[@]}
  do
    if [ -e $HOME/$file ]; then
      echo -ne "${YELLOW}EXISTS${NC} $HOME/$file"
      read -p " override? (y/n) " yn
    fi

    if [ $yn = "y" -o $yn = "Y" ]; then
      dist_file_path=$HOME/$file
      src_file_path=`pwd`/$file

      cp -f $src_file_path $dist_file_path
      echo -e "${GREEN}OVERRIDE${NC} ${dist_file_path}"
    fi
  done
else
  echo -e "${YELLOW}SKIP${NC}"
fi



if [ $OS = 'Mac' ]; then
  # finderで隠しファイルを表示する
  echo
  read -p "Do you wish to show hidden files with Finder? (y/n) " yn
  if [ $yn = "y" -o $yn = "Y" ]; then
    defaults write com.apple.finder AppleShowAllFiles TRUE
    echo -e "${GREEN}DONE${NC} Set setting to show all files in Finder App"
    killall Finder
    echo -e "${GREEN}DONE${NC} Restart Finder App"
  else
    echo -e "${YELLOW}SKIP${NC}"
  fi

  # .DS_Storeを作らないようにする
  echo
  read -p "Never create .DS_Store? (y/n) " yn
  if [ $yn = "y" -o $yn = "Y" ]; then
    defaults write com.apple.desktopservices DSDontWriteNetworkStores true
    echo -e "${GREEN}DONE${NC} Set setting to not write .DS_Store"
  else
    echo -e "${YELLOW}SKIP${NC}"
  fi
fi



# デフォルトシェルを変更
echo
read -p "Do you wish to change default shell? (zsh/n) " sh
if [ $sh = "zsh" ]; then
  command_exists zsh || install zsh
  chsh -s $(which zsh)
  source $HOME/.zshrc
  echo -e "${GREEN}DONE${NC} Change shell to $(which zsh)"
else
  echo -e "${YELLOW}SKIP${NC}"
fi



# Move to original path
popd > /dev/null



# Cleanup
rm -rf ${tempfile} ${workspace}
echo
echo -e "${GREEN}CLEAN UP${NC}"
echo -e "    ${tempfile}"
echo -e "    ${workspace}"
