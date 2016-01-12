if [ -d ~/.vim/bundle/Vundle.vim ]; then
    echo "vundle is already installed"
else
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall
