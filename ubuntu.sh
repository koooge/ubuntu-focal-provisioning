#!/bin/bash -e

install_apt_packages() {
  sudo apt update -qq
  sudo DEBIAN_FRONTEND=noninteractive apt dist-upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"
  sudo apt install -y curl git zip unzip bzip2 \
    ntp \
    gcc g++ make bison \
    tig tree jq peco dos2unix lv silversearcher-ag direnv
}

install_bash_profile() {
  mkdir -p ${HOME}/.bash.d
  cp -p .bash_profile  > ${HOME}/.bashrc # FIXME: .profie?
}

install_languages() {
  ./lang/install_golang.sh
  # ./lang/install_java.sh
  ./lang/install_node.sh
  # ./lang/install_python.sh
  # ./lang/install_ruby.sh
}

install_middlewares() {
  ./install_docker.sh
}

install_tools() {
  ./tool/install_heroku.sh
  ./tool/install_awscli.sh
  # ./tool/install_gcloud.sh
  # ./tool/install_kubectl.sh
}

install_apt_packages
install_bash_profile
curl -sSL raw.github.com/koooge/dotfiles/master/install.sh | bash

install_languages
install_middlewares
# install_tools
