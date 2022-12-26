#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob


echo " ---------------------- "
echo "| Insertion Into Table |"
echo " ---------------------- "

echo " ------------- "
echo "| Your Tables |"
echo " ------------- "
ls -p | grep -v / | grep -v _

read -p "Enter your table name which you want to insert: " insertTable

while [[ -z $insertTable || $insertTable == [0-9]* || $insertTable == *['!''@#/$\"*{^(+/|,;:~`.%&.=-]>[<?']* || $insertTable == *" "* ]] 
do
   read -p "Inavalid Table Name, enter another name to insert into table: " insertTable
done

until [ -f $insertTable ]
do
   read -p "Table name doesn't exist, enter another name to insert into table: " insertTable
done

numColumns=$(head -1 ./$insertTable"_metadata" | awk -F : '
{
      print NF
}
' )

col_arr=($(head -1 ./$insertTable"_metadata" | awk -F : '
   {+
            fields=split($0, arr); 
            for (i=0;i<=fields;i++) print arr[i] 
   }

' ))

col_type=($(tail -1 ./$insertTable"_metadata" | awk -F : '
   {
            fields=split($0, arr); 
            for (i=0;i<=fields;i++) print arr[i] 
   }

' ))


declare -i id
declare -a record_value
for (( i=0 ; i < numColumns ; i++))
do
    read -p "please enter ${col_arr[i]}: " value

    if [[ "${col_type[i]}" == "int" ]] ;then
       until [[ $value == +([0-9]) ]]
       do 
         read -p " you should enter integer value ,please enter ${col_arr[i]}: " value
       done
    else
       until [[ $value =~ [a-zA-Z][a-zA-Z0-9]* ]]
       do 
         read -p " you should enter string value ,please enter ${col_arr[i]}: " value
       done
    fi

    record_value+=($value)
    
done

echo ${record_value[@]}


for (( i=0 ; i < numColumns ; i++ ))
do 
  echo -n :${record_value[$i]} >> "./$insertTable"
done

echo >> "./$insertTable"
unset record_value[@]


















