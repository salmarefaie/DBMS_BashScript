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

while [[ ! -f $insertTable || -z $insertTable || $insertTable = [0-9]* || $insertTable = *['!''@#/$\"*{^({+/|,};:~)`.%&.=-]>[<?']* || $insertTable = *" "* ]] 
do
   if [[ ! -f $insertTable ]] ; then
      read -p "Table name doesn't exist, enter another name to insert into table: " insertTable
   else
      read -p "Inavalid Table Name, enter another name to insert into table: " insertTable
   fi
done

numColumns=$(head -1 ./$insertTable"_metadata" | awk -F : '
{
      print NF
}
' ) 

col_arr=($(head -1 ./$insertTable"_metadata" | awk -F : '
   {
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
       while [[ $value == +([0]) || $value != +([0-9]) ]]
       do 
         read -p " you should enter integer value ,please enter ${col_arr[i]}: " value
       done

    elif [[ "${col_type[i]}" == "string" ]] ;then
      while [[ -z $value || $value = [0-9]* || $value = *['!''@#/$\"*{^({+/|,};:~)`.%&.=-]>[<?']* || $value = *" "* ]]
      do  
         read -p " you should enter string value ,please enter ${col_arr[i]}: " value
       done
    fi
    
    #unique id
    if (( $i == 0 )) ;then
       while (( `cut -d":" -f1 ./$insertTable | grep $value | wc -w` > 0 ))
       do
          read -p " ${col_arr[i]} should be unique, please enter another value: " value
      done
    fi
    record_value+=($value)
    
done

echo ${record_value[@]}

for (( i=0 ; i < numColumns ; i++ ))
do 
  if (( i==0 )) ; then
     echo -n ${record_value[$i]} >> "./$insertTable"
  else
     echo -n :${record_value[$i]} >> "./$insertTable"
  fi
done
echo >> "./$insertTable"

echo " --------------- "
echo "| Data is Added |"
echo " --------------- "


unset record_value[@]


















