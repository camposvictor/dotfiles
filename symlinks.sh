#!/bin/bash

REPO_DIR="$HOME/.config"

if [ -d "$REPO_DIR" ]; then
	cd "$REPO_DIR" || exit

	# .zshrc
	ln -sf .zshrc "$HOME/.zshrc"

	echo "Link simbólico para .zshrc criado com sucesso em $REPO_DIR."
else
	echo "Diretório do repositório não encontrado: $REPO_DIR"
	exit 1
fi
