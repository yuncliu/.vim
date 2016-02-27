if [ ! -d ~/.vim ]; then
    git clone https://github.com/yuncliu/.vim.git ~/.vim
    cd ~/.vim
fi

sudo apt-get install exuberant-ctags

echo "Hellow"
if [ -d ~/.vim/bundle/Vundle.vim ]; then
    echo "vundle is already installed"
else
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall

if [ -f ~/.vim/stl_tags ]; then
    echo 'stl tags exist'
else
    echo 'creating stl tags'
    bash stl.sh
fi

if [ -f ~/.vim/usr_include_tags ]; then
    echo 'tags for /usr/include existed'
else
    echo 'creating tags for /usr/include'
    ctags -f usr_include_tags -R --c++-kinds=+p --fields=+iaS --extra=+q /usr/include
fi
