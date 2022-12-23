#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob

echo " ---------------- "
echo "| Table Creation |"
echo " ---------------- "
read -p "Enter your table name: " tableName

while [[ -z $tableName || $tableName == [0-9]* || $tableName == *['!''@#/$\"*{^(+/|,;:~`.%&.=-]>[<?']* || $tableName == *" "* ]] 
do
   read -p "Inavalid Table Name, enter another name: " tableName
done


while [ $tableName = $databaseName ]
do
   read -p "it is name of database, enter another name: " tableName
done


while [ -f $tableName ]
do
   read -p "Table name already exist, enter another name: " tableName
done

touch $tableName
touch "$tableName"_metadata""


echo " ------------------ "
echo "| Table is created |"
echo " ------------------ "

read -p "Enter number of fields for table: " number

while [[ $number == 0 ]]
do
    read -p "you should add number for columns: " number
    
done

until [[ $number == +([0-9]) ]]
do
    read -p "invalid number, please enter number of fields: " number
    
done

echo " ---------------------------------------------------------------"
echo "| Table is created with $number columns and 1st column is primary key |"
echo " ---------------------------------------------------------------"

declare -a col_name
declare -a col_datatype

for (( i=1 ; i <= $number ; i++ ))
do
  if (( $i == 1 )) ;then
     name="id"
     pk="true"
     dataType="int"
     echo "1st column is id, datatype is int and it is primart key"
     col_name+=($name)
     col_dataType+=($dataType)
  else
     pk="false"
     read -p "enter the name of column: " name
     echo "enter datatype of the column"
     select option in int string
       do
	case $option in 
		int )	
		    dataType="int"
		    break;
	        ;;
	        
		string )
		    dataType="string"
		    break;
	        ;;
	 esac
        done 
        col_name+=($name)
        col_dataType+=($dataType)
   fi
done

# echo ${col_name[@]}
# echo ${col_dataType[@]}

for (( i=0 ; i < $number ; i++ ))
do 
  echo -n ${col_name[$i]}: >> "./$tableName"_metadata""
  
done

for (( i=0 ; i < $number ; i++ ))
do 
  echo -n ${col_datatype[$i]}: >> "./$tableName"_metadata""
  
done
























