#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob

# metadata for table
col_selectArr=($(head -1 ./$selectTable"_metadata" | awk -F : '
   {
            fields=split($0, arr); 
            for (i=0;i<=fields;i++) print arr[i] 
   }
' ))

# num of columns for table
numSelectColumns=$(head -1 ./$selectTable"_metadata" | awk -F : '
{
      print NF
}
' )

# metadata datatype for table
colSelectArr_type=($(tail -1 ./$selectTable"_metadata" | awk -F : '
   {
            fields=split($0, arr); 
            for (i=0;i<=fields;i++) print arr[i] 
   }
' ))

# take id or name or ....
read -p "Enter name column which is selected row by it: " column

# check regex column name
if [[ -z $column || $column == [0-9]* || $column == *['!''@#/$\"*{^(+/|,;:~`.%&.=-]>[<?']* || $column == *" "* ]] ;then
   echo " ---------------------- "
   echo "| Inavalid Column Name |" 
   echo " ---------------------- "

declare -i index         # num of column for table
declare -i index_value   # num of row which is selected
declare -a search_row    # array elly h7d feha values bta3t column da  

# check lw mwgood fy table metadata
elif [[ ${col_selectArr[*]} =~ $column ]] ; then

      # bageeb num of column for table
      for (( i=1; i <= $numSelectColumns ; i++ ))
      do 
         if [[ "${col_selectArr[i-1]}" == "$column" ]] ; then
            index=$i
            echo $index
            type=${colSelectArr_type[$index-1]}
            echo $type
         fi
      done
      
      # h7od el values btta3t column da fy array
      search=`cat ./$selectTable | cut -d":" -f $index`
      echo $search > column
      search_row=($(cat ./column | awk '
      {
               fields=split($0, arr); 
               for (i=0;i<=fields;i++) print arr[i] 
      }

   ' ))
   rm column

   #  take value of column to select this row
   read -p "Enter value of column which is selected row by it: " column_value
   
   # check type to take true value
   if [[ "$type" = "int" ]] ;then
      while [[ $column_value == +([0]) || $column_value != +([0-9]) ]]
      do 
      read -p " Invalid Value, you should enter an integer value: " column_value
      done
   elif [[ "$type" == "string" ]] ;then
      while [[ -z $column_value || $column_value = [0-9]* || $column_value = *['!''@#/$\"*{^({+/|,};:~)`.%&.=-]>[<?']* || $column_value = *" "* ]]
      do 
      read -p " Invalid Value, you should enter a string value: " column_value
      done
   fi

   # bageeb num of row and select it
   if [[ ${search_row[*]} =~ $column_value ]] ; then
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

# column name m4 mwgood
else
   echo " ---------------------- "
   echo "| Column doesn't Exist |"
   echo " ---------------------- "

fi