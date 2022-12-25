#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob

echo " -------------------"
echo "| Database Creation |"
echo " -------------------"
read -p "Enter your database name: " databaseCreateName


while [[ -e $databaseCreateName ||-z $databaseCreateName || $databaseCreateName == [0-9]* || $databaseCreateName == *['!''@#/$\"*{^(+/|,;:~`.%&.=-]>[<?']* || $databaseCreateName == *" "* ]] 
do
   if [ -e $databaseCreateName ] ; then
        read -p "Databse name already exist, enter another name: " databaseCreateName
   else    
        read -p "Inavalid Databse Name, enter another name: " databaseCreateName
   fi
done

mkdir $databaseCreateName
echo " --------------------- "
echo "| Database is created |"
echo " --------------------- "
   



<<Comment
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

while [ -e $databaseCreateName]
do
   read -p "Databse name already exist, enter another name: " databaseName
done

mkdir $databaseCreateName
echo " --------------------- "
echo "| Database is created |"
echo " --------------------- "
Comment

