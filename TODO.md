# TODO

disale root account

backports
fix roles/iut-base/tasks/packages
compléter roles/sudo_user avec chef 'base-users'
desktop: maj url package pour ghostty
desktop-packages: brave, teams, docker/podman, packer, vagrant
                  virtualbox: enable + maj url repo trixie
iut-base:
  packages: deborphan, rcconf

iut-pedago:
  packages:
      - gcc-doc
      - gcc-doc-base
      - gdb-doc

iut-desktop:
  packages:
      - ttf-mscorefonts-installer

TASK [iut-desktop : Désactiver et arrêter le service Veyon]

pipx= ast-grep-cli

neovim:
  0.11
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

teams

def "mysetup desktop burp" [] {

  if ( ('/opt/BurpSuiteCommunity' | path type) != dir) and (($"($env.HOME)/BurpSuiteCommunity" | path type) != dir) {

    echo 'sys.adminRights$Boolean=true' | lines | save /tmp/response.varfile
    echo 'sys.fileAssociation.extensions$StringArray="burp"' | lines | save --append /tmp/response.varfile
    echo 'sys.fileAssociation.launchers$StringArray="70"' | lines | save --append /tmp/response.varfile
    echo 'sys.installationDir=/opt/BurpSuiteCommunity' | lines | save --append /tmp/response.varfile
    echo 'sys.languageId=en' | lines | save --append /tmp/response.varfile
    echo 'sys.programGroupDisabled$Boolean=false' | lines | save --append /tmp/response.varfile
    echo 'sys.symlinkDir=/usr/local/bin' | lines | save --append /tmp/response.varfile

    echo "Downloading BurpSuite"
    curl -sSL "https://portswigger.net/burp/releases/download?product=community&type=Linux" -o /tmp/burp.sh

    echo "Installation BurpSuite"
    sudo sh /tmp/burp.sh -q -varfile /tmp/response.varfile | ignore

    sudo chown root:root /opt/BurpSuiteCommunity/burpbrowser/*/chrome-sandbox
    sudo chmod u+s /opt/BurpSuiteCommunity/burpbrowser/*/chrome-sandbox

  }

}

def "mysetup desktop multimedia" [] {

  let pkgs = [
        guvcview
          handbrake*
          libdvdnav4
          libdvd-pkg
          libdvdread8
          libnfs13
          mpv
          v4l2loopback-dkms
          v4l-utils
          vlc
          vlc-plugin-base
  ]

  echo "Install Multimedia"
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -qq -y $pkgs | ignore
  sudo dpkg-reconfigure libdvd-pkg

  echo "Install songrec"
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -qq -y build-essential libasound2-dev libgtk-3-dev libssl-dev | ignore
  cargo install songrec | ignore

}

def "mysetup desktop pkgs" [] {

  let pkgs = [
    calibre
    copyq
    flameshot
    fonts-arphic-ukai
    fonts-arphic-uming
    fonts-ipafont-mincho
    fonts-ipafont-gothic
    fonts-unfonts-core
    freerdp2-x11
    icedtea-netx
    keychain
    libcanberra-gtk-module
    libreoffice
    lightdm-remote-session-freerdp2
    network-manager-pptp-gnome
    okular
    cpu-x
    rdesktop
    ssh-askpass-gnome
    ttf-xfree86-nonfree
    wireshark
    xclip
    zathura
  ]

  sudo DEBIAN_FRONTEND=noninteractive apt-get -qq -y install $pkgs | ignore

  let franz = (do -i {dpkg-query -W -f='${Status}' franz } | complete)
  if ( ($franz).exit_code == 1 ) {
    echo "Installing Franz"
    curl -sSL (github latestdownload meetfranz/franz amd64.deb).0 -o /tmp/franz.deb
    sudo DEBIAN_FRONTEND=noninteractive apt-get -qq -y install /tmp/franz.deb | ignore
  }

}

# Disable Wayland

def "mysetup desktop wayland" [] {
  echo "Disable GDM Wayland"
  sudo sed -i 's/#Wayland/Wayland/g' /etc/gdm3/daemon.conf
}
