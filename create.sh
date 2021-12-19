#!/bin/bash
#Adjust variables as needed to fit desired input/output
text_file="./emily.txt"
c_file="emily.c"
out_file="emily"

#Cleans-up existing C source and compiled binary files
if [ -f "$c_file" ]
then
    rm "./$c_file"
fi
if [ -f "$out_file" ]
then
    rm "./$out_file"
fi

#Addes necessary C syntax
echo "#include <stdio.h>" >> $c_file
echo "int main() {" >> $c_file

#Main loop to read each line of "text_file" and output to C source file
while IFS= read -r line
do 
    if [[ $line = '' ]]; then
      #Adjust sleep(n) to number of seconds to delay between newlines w/o other chars
      echo "   sleep(5);" >> $c_file
    fi
    #Fixing "\" escape issues when going from ASCII/text to C printf syntax
    out=$(echo "${line//\\/\\\\}")
    echo "   printf(\"$out\n\");" >> $c_file
done < "$text_file"

#Add additional C syntax for return and end of main function
echo "   return 0;" >> $c_file
echo "}" >> $c_file

#Compile
gcc "$c_file" -o "$out_file"

#Uncomment below to remove C source file after compile
#rm $c_file