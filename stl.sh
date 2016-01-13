#!/bin/bash


if [ $# != 1 ]; then
    p='/usr/include/c++/4.8'
else
    p=$1
fi
echo $p
cp -r $p cpp_src
find ./cpp_src -type f | xargs sed -i 's/namespace std _GLIBCXX_VISIBILITY(default)/namespace std/'
ctags -f stl_tags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -I _GLIBCXX_NOEXCEPT cpp_src
sed -i 's/cpp_src/\/usr\/include\/c++\/4.8/' stl_tags
rm -rf cpp_src
