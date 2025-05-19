# TODO

fix roles/iut-base/tasks/packages
compléter roles/sudo_user avec chef 'base-users'
desktop:
  maj url package pour ghostty
  ttf-ubuntu-font-family
desktop-packages: teams, docker/podman
                  virtualbox: enable + maj url repo trixie
iut-base:
  packages: deborphan, rcconf
  roles/sudo-user/tasks/sudo.yml et roles/sudo-user/tasks/user.yml redondants

iut-desktop:
  update-grub: tâche à valider
  tache veyon à mettre à jour
  tache ssh => sudo

iut-pedago:
  sssd: commandes realm join si extra_vars realm_user
  tache sudo admin sirm

neovim:
  0.11
    <https://github.com/basecamp/omakub/blob/master/install/terminal/app-neovim.sh>

  :help clipboard

laptop:
  Checking if system is running on battery is skipped. Please install powermgmt-base package to check power status and skip installing updates when the system is running on battery.

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
