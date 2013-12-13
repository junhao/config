config
======

Configuration files across machines
(e.g. .vimrc, .vim, .gitconfig, .bashrc.common)

# How to apply config files
1. git clone the project into ~/config
2. Add 'source ~/.bashrc.common' to ~/.bash_profile or ~/.bash_login

   if [ -f ~/.bashrc.common ]; then
     source ~/.bashrc.common
   fi

3. run './init.sh'
4. install Vundle and other bundles
   $ git submodule update --init
   open Gvim and do :BundleInstall
   YouCompleteMe will probably complain, if so:
     $ cd ~/config/.vim/bundle/YouCompleteMe
     $ ./install.sh

# To revert what you did
  run './init.sh revert'

# Changes in the future
- make all generic changes of bash shell config in .bashrc.common
- add vim bundles in .vimrc
  e.g. Bundle 'Valloric/YouCompleteMe'
