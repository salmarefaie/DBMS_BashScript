#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob


# id or name or ....
read -p "Enter name column which is selected row by it: " column

if [[ -z $column|| $column== [0-9]* || $column == *['!''@#/$\"*{^(+/|,;:~`.%&.=-]>[<?']* || $column == *" "* ]] ;then
   echo " ---------------------- "
   echo "| Inavalid Column Name |" 
   echo " ---------------------- "

elif [ ] ; then
  

else
   echo " ---------------------- "
   echo "| Column doesn't Exist |"
   echo " ---------------------- "