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
