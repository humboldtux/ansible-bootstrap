# TODO

backports
fix roles/iut-base/tasks/packages
compléter roles/sudo_user avec chef 'base-users'
desktop: maj url package pour ghostty
desktop-packages: teams, docker/podman, packer, vagrant
                  virtualbox: enable + maj url repo trixie
iut-base:
  packages: deborphan, rcconf

iut-desktop:
  packages:
      Erreur : Impossible de trouver le paquet freerdp2-x11
      Erreur : Impossible de trouver le paquet libcanberra-gtk-module
      Erreur : Impossible de trouver le paquet lightdm-remote-session-freerdp2
  update-grub: tâche à valider
  TASK [iut-desktop : Désactiver et arrêter le service Veyon]

neovim:
  0.11
    <https://github.com/basecamp/omakub/blob/master/install/terminal/app-neovim.sh>

  :help clipboard

node?

rust binaries:
Error: Unable to locate package bandwhich
Error: Unable to locate package carapace
Error: Unable to locate package navi
Error: Unable to locate package topgrade
Error: Unable to locate package up
Error: Unable to locate package viu
Error: Unable to locate package wtf
Error: Unable to locate package yazi

crowdsec

sudo apt install -y vlc
sudo apt install -y libavcodec-extra libdvd-pkg; sudo dpkg-reconfigure libdvd-pkg
sudo apt install -y obs-studio
