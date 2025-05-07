#!/bin/bash
# bootstrap-ansible.sh

# Récupérer les tags et extra-vars depuis les variables d'environnement
TAGS=${ANSIBLE_TAGS:-"base"}
EXTRA_VARS=${ANSIBLE_EXTRA_VARS:-"sudo_user=ben"}

# Construire la commande ansible-pull de base
ANSIBLE_CMD="cd /tmp/ansible-bootstrap && sudo ansible-playbook -i localhost, -c local playbook.yml"

# Ajouter les tags si définis
if [ -n "$TAGS" ]; then
  ANSIBLE_CMD="$ANSIBLE_CMD --tags \"$TAGS\""
fi

# Ajouter les extra-vars si définis
if [ -n "$EXTRA_VARS" ]; then
  ANSIBLE_CMD="$ANSIBLE_CMD --extra-vars \"$EXTRA_VARS\""
fi

# Installer Ansible et Git si ce n'est pas déjà fait
apt update
apt install -y ansible git

git clone https://github.com/humboldtux/ansible-bootstrap.git /tmp/ansible-bootstrap

echo
echo "Exécuter:"
echo $ANSIBLE_CMD
