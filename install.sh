if [ -f ~/.vimrc ]; then
    echo "no ~/.vimrc"
else
    cp ~/.vim/vimrc ~/.vimrc
fi

if [ -d ~/.vim/bundle/Vundle.vim ]; then
    echo "vundle is already installed"
else
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall
#clang_complete
#apt-get install libclang-dev
