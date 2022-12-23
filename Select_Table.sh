#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob



cho " ---------------- "
echo "| Table selection|"
echo " ---------------- "


echo "Available tables ";
ls -p | grep -v / | grep -v _ ;

read -p "Enter  table you want to select from: " tableName

while [[ -z $tableName || $tableName == [0-9]* || $tableName == *['!''@#/$\"*{^(+/|,;:~`.%&.=-]>[<?']* || $tableName == *" "* ]] 
do
   read -p "Inavalid Table Name, enter another name: " tableName
done


select choice in "Select all columns" "select specific column" "select columns where condition" 
do
	case $choice in
		 "Select all columns") 
			;;
		"select specific columns")

			
                         ;;
		"select columns where condition") 
			;;
