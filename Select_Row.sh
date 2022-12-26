#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob

col_selectArr=($(head -1 ./$selectTable"_metadata" | awk -F : '
   {
            fields=split($0, arr); 
            for (i=0;i<=fields;i++) print arr[i] 
   }

' ))
numSelectColumns=$(head -1 ./$selectTable"_metadata" | awk -F : '
{
      print NF
}
' )

# id or name or ....
read -p "Enter name column which is selected row by it: " column

if [[ -z $column || $column == [0-9]* || $column == *['!''@#/$\"*{^(+/|,;:~`.%&.=-]>[<?']* || $column == *" "* ]] ;then
   echo " ---------------------- "
   echo "| Inavalid Column Name |" 
   echo " ---------------------- "

declare -i index
declare -i index_value
declare -a search_row

elif [[ ${col_selectArr[*]} =~ $column ]] ; then
    for (( i=1; i <= $numSelectColumns ; i++ ))
    do 
      if [[ "${col_selectArr[i-1]}" == "$column" ]] ; then
          index=$i
      fi
    done
    search=`cat ./$selectTable | cut -d":" -f $index`
    echo $search > column
    search_row=($(cat ./column | awk '
   {
            fields=split($0, arr); 
            for (i=0;i<=fields;i++) print arr[i] 
   }

' ))
  echo ${search_row[*]}
  rm column

  #  value of column
  read -p "Enter value of column which is selected row by it: " column_value
  if [[ -z $column_value || $column_value == [0-9]* || $column_value == *['!''@#/$\"*{^(+/|,;:~`.%&.=-]>[<?']* || $column_value == *" "* ]] ;then
   echo " ------------------------------- "
   echo "| Inavalid Value of Column Name |" 
   echo " ------------------------------- "

  elif [[ ${search_row[*]} =~ $column_value ]] ; then
   for (( i=1; i <= ${#search_row[*]} ; i++ ))
      do 
         if [[ "${search_row[i-1]}" == "$column_value" ]] ; then
               index_value=$i
         fi
      done
   sed -n ''$index_value' p' ./$selectTable
   
  else
   echo " ------------------------------- "
   echo "| Value of Column doesn't Exist |"
   echo " ------------------------------- "
  fi  

else
   echo " ---------------------- "
   echo "| Column doesn't Exist |"
   echo " ---------------------- "

fi