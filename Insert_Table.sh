#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob


echo " --------------------- "
echo "| Insertion Into Table|"
echo " --------------------- "

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
   {
            fields=split($0, arr); 
            for (i=0;i<=fields;i++) print arr[i] 
   }

' ))

declare -i id
declare -a record_value
for (( i=0 ; i < numColumns ; i++))
do
  if (( $i == 0 )) ;then
    if [ -s ./$insertTable ]; then
      id=$id+1
      value=$id
      record_value+=($value)
    else
      id=1
      value=$id
      record_value+=($value)
    fi
  else
    read -p "please enter ${col_arr[i]}: " value
    record_value+=($value)
  fi
done

echo ${record_value[@]}


for (( i=0 ; i < numColumns ; i++ ))
do 
  echo -n ${record_value[$i]}: >> "./$insertTable"
done

echo >> "./$insertTable"
unset record_value[@]


















