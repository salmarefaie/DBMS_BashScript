#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob

echo " -------------------"
echo "| Database Creation |"
echo " -------------------"
read -p "Enter your database name: " databaseCreateName


while [[ -z $databaseCreateName|| $databaseCreateName == [0-9]* || $databaseCreateName == *['!''@#/$\"*{^(+/|,;:~`.%&.=-]>[<?']* || $databaseCreateName == *" "* ]] 
do
   read -p "Inavalid Databse Name, enter another name: " databaseCreateName
done
   
if [ -e $databaseCreateName ] ; then
    echo " ---------------------------- "
    echo "| Databse name already exist |" 
    echo " ---------------------------- "
else
   mkdir $databaseCreateName
   echo " --------------------- "
   echo "| Database is created |"
   echo " --------------------- "

fi


<<Comment
while [ -e $databaseCreateName]
do
   read -p "Databse name already exist, enter another name: " databaseName
done

mkdir $databaseCreateName
echo " --------------------- "
echo "| Database is created |"
echo " --------------------- "
Comment

