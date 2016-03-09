#!/bin/bash

function install_color()
{
    current=`pwd`
    if [ ! -d ~/.vim/colors ]; then
        mkdir -p ~/.vim/colors
    fi
    cd ~/.vim/colors
    echo "Downloading molokai.vim"
    curl https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim > molokai.vim
    cd $current
}

function generate_stl_tag()
{
    for v in `ls /usr/include/c++`
    do
        break
    done
    p='/usr/include/c++/'$v

    cp -r $p cpp_src
    find ./cpp_src -type f | xargs sed -i 's/namespace std _GLIBCXX_VISIBILITY(default)/namespace std/'
    ctags -f stl.tags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -I _GLIBCXX_NOEXCEPT cpp_src
    #sed -i 's/cpp_src/\/usr\/include\/c++\/$v/' stl_tags
    cmd="sed -i ""s/cpp_src/\/usr\/include\/c++\/$v/"" stl.tags"
    x=`$cmd`
    rm -rf cpp_src
}

if [ ! -d ~/.vim ]; then
    git clone https://github.com/yuncliu/.vim.git ~/.vim
    cd ~/.vim
fi

install_color

if [ ! -f /usr/bin/ctags ]; then
    echo "no ctags, please enter password to install ctags"
    echo "sudo apt-get install exuberant-ctags"
    sudo apt-get install exuberant-ctags
fi

echo "Hellow"
if [ -d ~/.vim/bundle/Vundle.vim ]; then
    echo "vundle is already installed"
else
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

vim +PluginInstall +qall

if [ ! -f /usr/bin/ctags ]; then
    echo "can't find ctags, can't generate tags"
    echo "Please run 'sudo apt-get install exuberant-ctags' to install ctags"
else
    if [ -f ~/.vim/stl.tags ]; then
        echo 'stl tags exist'
    else
        echo 'creating stl tags'
        generate_stl_tag
    fi

    if [ -f ~/.vim/usr_include.tags ]; then
        echo 'tags for /usr/include existed'
    else
        echo 'creating tags for /usr/include'
        ctags -f usr_include.tags -R --c++-kinds=+p --fields=+iaS --extra=+q /usr/include
    fi
fi
