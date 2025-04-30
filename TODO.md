# TODO

backports
fix roles/iut-base/tasks/pakages
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
      - manpages-posix
      - manpages-posix-dev

iut-desktop:
  packages:
      - ttf-mscorefonts-installer

TASK [iut-desktop : Désactiver et arrêter le service Veyon]
