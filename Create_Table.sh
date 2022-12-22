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
while [[ $number != [0-9] ]]
do
    read -p "invalid number, please enter number of fields: " number
    
done


