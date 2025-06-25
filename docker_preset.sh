#!/bin/bash

S21_DIR="$HOME/s21"
SSH_SOURCE_DIR="$HOME/s21/.ssh"
SSH_TARGET_DIR="$HOME/.ssh"

KEY_SOURCE="$SSH_SOURCE_DIR/id_ed25519"
KEY_TARGET="$SSH_TARGET_DIR/id_ed25519"

KEY_SOURCE_PUB="$SSH_SOURCE_DIR/id_ed25519.pub"
KEY_TARGET_PUB="$SSH_TARGET_DIR/id_ed25519.pub"

sudo chown -R ashaclem:ashaclem $S21_DIR
sudo chmod -R u+rwX S21_DIR

if [ ! -d "$SSH_TARGET_DIR" ]; then
  mkdir -p "$SSH_TARGET_DIR"
  echo "$SSH_TARGET_DIR created"
fi


if [ -f "$KEY_SOURCE" ]; then
  cp "$KEY_SOURCE" "$KEY_TARGET"
  echo "Copied private key to $KEY_TARGET"
else
  echo "Source private key $KEY_SOURCE not found"
  exit 1
fi


if [ -f "$KEY_SOURCE_PUB" ]; then
  cp "$KEY_SOURCE_PUB" "$KEY_TARGET_PUB"
  echo "Copied public key to $KEY_TARGET_PUB"
else
  echo "Source public key $KEY_SOURCE_PUB not found"
  exit 1
fi

chmod 600 "$KEY_TARGET"
chmod 644 "$KEY_TARGET_PUB"
chown ashaclem:ashaclem "$KEY_TARGET" "$KEY_TARGET_PUB"

git config --global user.name ashaclem
git config --global user.email ashaclem@student.21-school.ru
