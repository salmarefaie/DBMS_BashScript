#!/usr/bin/bash

echo " -------------------"
echo "| Database Creation |"
echo " -------------------"
read -p "Enter your database name: " databaseName


while [[ -z $databaseName || $databaseName == [0-9]* || $databaseName == *['!''@#/$\"*{^(+/|,;:~`.%&.=-]>[<?']* ]] 
do
   read -p "Inavalid Databse Name, enter another name: " databaseName
done


while [ -e $databaseName ]
do
   read -p "Databse name already exist, enter another name: " databaseName
done
  
mkdir $databaseName 
echo " --------------------- "
echo "| Database is created |"
echo " --------------------- "


