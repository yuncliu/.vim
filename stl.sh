#!/bin/bash


if [ $# != 1 ]; then
    echo "exit"
    exit
fi
echo $1
cp -r $1 cpp_src
find ./cpp_src -type f | xargs sed -i 's/namespace std _GLIBCXX_VISIBILITY(default)/namespace std/'
ctags -f stl_tags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -I _GLIBCXX_NOEXCEPT cpp_src
