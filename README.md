#my vim files

###installation
```
 $ git clone git@github.com:flypiggy/my_vimfiles.git ~/.vim
 $ ln -s ~/.vim/vimrc ~/.vimrc
```
install NeoBundle

```
 $ mkdir -p ~/.vim/bundle
 $ git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

```
Then execute **:NeoBundleInstall** in your vim


###fonts
For vim-airline if the font symbols are partially messed up.
Find prepatched fonts in the [powerline-fonts](https://github.com/Lokaltog/powerline-fonts) repository.
Install the fonts you like & change it to your terminal's font.



```
Install fonts in linux

 $ mkdir ~/.fonts
 $ cp ~/.vim/font/Monaco_Linux-Powerline.ttf ~/.fonts/
 $ fc-cache -vf
```

###list of plugins
* [markdown](https://github.com/tpope/vim-markdown 'Markdown') Syntax highlighting and matching rules for Markdown.
* [nerd_tree](https://github.com/scrooloose/nerdtree 'NERD_tree') The NERD Tree.
* [rails](https://github.com/tpope/vim-rails 'vim-rails') Lot’s of tools to make it easier to manage your Rails projects.
