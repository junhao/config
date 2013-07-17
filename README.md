config
======

Configuration files across machines
(e.g. .vimrc, .vim, .gitconfig, .bashrc.common)

# How to apply config files
1. git clone the project into ~/config
2. Add 'source ~/.bashrc.common' to ~/.bash_profile
3. run './init.sh'

# To revert what you did
  run './init.sh revert'

# Changes in the future
- make all generic changes of bash shell config in .bashrc.common
- add vim bundles as git submodule
  (add <git-repository> in .gitmodules)
