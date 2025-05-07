# README

## Bootstrapper une VM Incus

### Exécuter en ligne

```bash
wget -q https://raw.githubusercontent.com/humboldtux/ansible-bootstrap/main/bootstrap-ansible.sh -O- | sudo bash -
```

### Exécuter en local

```bash
ANSIBLE_TAGS="sudo-user" ANSIBLE_EXTRA_VARS="sudo_user=ben" ./bootstrap-ansible.sh
# Où
sudo ansible-pull -U https://github.com/humboldtux/ansible-bootstrap.git -C main -i localhost, -d /opt/ansible playbook.yml --tags "desktop" --extra-vars "sudo_user=ben"
```

### Lancer la VM

```bash
incus launch images:debian/13/cloud debian13-test --vm --profile default --config=cloud-init.user-data="$(cat <<EOF
#cloud-config
packages:
  - curl

runcmd:
  - curl -sSL https://raw.githubusercontent.com/humboldtux/ansible-bootstrap/main/bootstrap-ansible.sh | bash
EOF
)"
```

### Lancer une VM de test locale pour écrire les rôles Ansible

Au préalable, si travail en remote différent de s760:

```bash
sshfs -o idmap=user s760p02:/home/${USERNAME}/dev/src/github.com/humboldtux/ansible-bootstrap /home/${USERNAME}/dev/src/github.com/humboldtux/ansible-bootstrap
```

Puis, création VM:

```bash
incus create images:debian/13/cloud debian13-test --vm --profile default --config=cloud-init.user-data="$(cat <<EOF
#cloud-config
packages:
  - ansible
  - curl

runcmd:
  - cd /mnt/ansible-bootstrap && ansible-playbook -i localhost, -c local playbook.yml --tags "base" --extra-vars "sudo_user=ben"
EOF
)" && \
incus config device override debian13-test root size=30GB && \
incus config set debian13-test limits.cpu=4 limits.memory=4GiB && \
incus config device add debian13-test srcdir disk source=$(pwd) path=/mnt/ansible-bootstrap && \
incus start debian13-test
```

### Attendre la fin du lancement puis de cloud-init

```bash
watch -n 1 -d "incus info debian13-test  | grep 'Operating System' -A5" && \
incus exec debian13-test -- cloud-init status --long --wait
```

### Se connecter

```bash
incus exec debian13-test -- bash
```
