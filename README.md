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

### Attendre la fin du lancement puis de cloud-init

```bash
watch -n 1 -d "incus info debian13-test  | grep 'Operating System' -A5"
incus exec  debian13-test -- cloud-init status --long --wait
```

### Se connecter

```
incus exec  debian13-test -- bash
```
