# README

## bootstrapper une VM Incus

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

Au préalable, si travail en remote différent de s760p02:

```bash
sshfs -o idmap=user s760p02:/home/benben/dev/src/github.com/humboldtux/ansible-bootstrap /home/benben/dev/src/github.com/humboldtux/ansible-bootstrap
```

Puis, création VM:

```bash
incus create images:debian/13/cloud debian13-test --vm --profile default --config=cloud-init.user-data="$(cat <<EOF
#cloud-config
packages:
  - ansible
  - curl

runcmd:
  - cd /mnt/ansible-bootstrap && ansible-playbook -i localhost, -c local site.yml
EOF
)"

incus config device add debian13-test srcdir disk source=$(pwd) path=/mnt/ansible-bootstrap
incus start debian13-test
```

### Attendre la fin du lancement puis de cloud-init

```bash
watch -n 1 -d "incus info debian13-test  | grep 'Operating System' -A5"
incus exec debian13-test -- cloud-init status --long --wait
```

### Se connecter

```bash
incus exec debian13-test -- bash
```
