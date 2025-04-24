#!/bin/bash
# bootstrap-ansible.sh

# Installer Ansible et Git si ce n'est pas déjà fait
apt update
apt install -y ansible git

# Récupérer le playbook depuis le dépôt GitHub
ansible-pull -U https://github.com/humboldtux/ansible-bootstrap.git -C main -i localhost, -d /opt/ansible playbook.yml
