#!/bin/bash
for v in `ls /usr/include/c++`
do
    break
done
p='/usr/include/c++/'$v

cp -r $p cpp_src
find ./cpp_src -type f | xargs sed -i 's/namespace std _GLIBCXX_VISIBILITY(default)/namespace std/'
ctags -f stl_tags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -I _GLIBCXX_NOEXCEPT cpp_src
#sed -i 's/cpp_src/\/usr\/include\/c++\/$v/' stl_tags
cmd="sed -i ""s/cpp_src/\/usr\/include\/c++\/$v/"" stl_tags"
x=`$cmd`
rm -rf cpp_src
