# TODO

base:
  crowdsec
  rust binaries:
    Error: Unable to locate package bandwhich
    Error: Unable to locate package carapace
    Error: Unable to locate package navi
    Error: Unable to locate package topgrade
    Error: Unable to locate package up
    Error: Unable to locate package viu
    Error: Unable to locate package wtf
    Error: Unable to locate package yazi

iut-base:
  sudoers: pberthon, bilancin, fmartinez, sssd?
  packages: deborphan, rcconf
  neovim:
    0.11
    <https://github.com/basecamp/omakub/blob/master/install/terminal/app-neovim.sh>
    :help clipboard

iut-pedago:
  sssd: commandes realm join si extra_vars realm_user
  /etc/skel

desktop:
  maj url package pour ghostty
  ttf-ubuntu-font-family

iut-desktop:
  tache veyon à mettre à jour
  desktop-packages: teams, docker/podman
                  virtualbox: enable + maj url repo trixie

sudo apt install -y vlc
sudo apt install -y libavcodec-extra libdvd-pkg; sudo dpkg-reconfigure libdvd-pkg
sudo apt install -y obs-studio
