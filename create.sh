#!/bin/bash
text_file="./emily.txt"
c_file="emily.c"
out_file="emily"
if [ -f "$c_file" ]
then
    rm "./$c_file"
fi
if [ -f "$out_file" ]
then
    rm "./$out_file"
fi
echo "#include <stdio.h>" >> $c_file
echo "int main() {" >> $c_file
while IFS= read -r line
do 
    if [[ $line = '' ]]; then
      echo "   sleep(5);" >> $c_file
    fi
    out=$(echo "${line//\\/\\\\}")
    echo "   printf(\"$out\n\");" >> $c_file
done < "$text_file"
echo "   return 0;" >> $c_file
echo "}" >> $c_file

gcc "$c_file" -o "$out_file"