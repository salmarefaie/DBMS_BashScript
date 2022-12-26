#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob



echo " ----------------- "
echo "| Table selection |"
echo " ----------------- "

echo " ------------- "
echo "| Your Tables |"
echo " ------------- "
ls -p | grep -v / | grep -v _

read -p "Enter your table name which you want to select from it: " selectTable

if [[ -z $selectTable || $selectTable == [0-9]* || $selectTable == *['!''@#/$\"*{^(+/|,;:~`.%&.=-]>[<?']* || $selectTable == *" "* ]] ;then
   echo " -------------------- "
   echo "| Inavalid Table Name |" 
   echo " -------------------- "

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
