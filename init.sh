#!/bin/bash

files=( .vim .vimrc .gvimrc .gitconfig .bashrc.common .git-completion.bash .git-prompt.sh )
BACKUP_DIR=$HOME/.backup
if [[ $1 != 'revert' ]]; then
  echo "Update all submodules ..."
  git submodule update --init
  mkdir -p $BACKUP_DIR
fi

for f in "${files[@]}"
do
  if [[ $1 = 'revert' ]]; then
    echo "Revert $f ..."
    if [[ -h $HOME/$f ]]; then
      rm $HOME/$f
      mv $BACKUP_DIR/$f $HOME/$f
    fi
  else
    echo "Back up and create symlink for $f ..."
    if [[ -h $HOME/$f ]]; then
      echo "$HOME/$f is already a symbolic link" 1>&2
    else
      mv $HOME/$f $BACKUP_DIR/$f
      ln -s $PWD/$f $HOME/$f
    fi
  fi
done

# source .bashrc.common from .bash_profile
cat >> $HOME/.bash_profile << EOL
if [ -f ~/.bashrc.common ]; then
  source ~/.bashrc.common
fi
EOL
