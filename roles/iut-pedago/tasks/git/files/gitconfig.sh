#!/bin/sh

echo "Configuration automatique du client Git...."
#git config --global http.sslVerify false
git config --global credential.helper "cache --timeout=3600"
git config --global user.name "$USER"
git config --global user.email "$USER"@etu.univ-cotedazur.fr

echo "Configuration terminée",
echo "Merci de vérifier que le contenu de $HOME/.gitconfig est correct!"
