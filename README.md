Config Files
======
Configuration files across machines
(e.g. .vimrc, .vim, .gitconfig, .bashrc.common)

Installation
----
1.  Set up config repo

    ```sh
    $ git clone https://github.com/junhao/config.git ~/.vim/config
    ```
2.  Setup configuration

    ```sh
    $ ./init.sh
    ```
3.  Install Vundle and other bundles

    Launch `vim`, run `:BundleInstall`
4. If Vundle complains about YouCompleteMe, run the following commands

    ```sh
    $ cd ~/config/.vim/bundle/YouCompleteMe
    $ ./install.sh
    ```

To revert what you did
----
```sh
$ ./init.sh revert
```

Changes in the future
----
- Make all generic changes of bash shell config in .bashrc.common

- Add vim bundles in .vimrc

    e.g. `Bundle 'Valloric/YouCompleteMe'`

