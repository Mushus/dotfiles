#!/usr/bin/env bash

# 未定義な変数があったら途中で終了する
set -u

SCRIPT_DIR=$(cd $(dirname $0); pwd)
IGNORE_PATTERN="^\.(git|gitignore|DS_Store)"

cd $SCRIPT_DIR
for dotfile in .??*; do
	[[ $dotfile =~ $IGNORE_PATTERN ]] && continue
	[[ $dotfile =~ "\\.bk$" ]] && continue
	[[ -L $HOME/$dotfile ]] && continue
	[[ -e "$HOME/$dotfile" ]] && mv "$HOME/$dotfile" "$SCRIPT_DIR/$dotfile.bk"

	ln -snfv "$SCRIPT_DIR/$dotfile" $HOME/$dotfile
done

if ! grep -q "bashrc_env" $HOME/.bashrc; then
  echo "source $HOME/.bashrc_env" >> $HOME/.bashrc
fi

