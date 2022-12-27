#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob

echo " ------------------- "
echo "| Database Removing |"
echo " -------------------"
ls -F | grep "/"


read -p "Enter your database which you want to delete: " databaseDelete

if [[ -z $databaseDelete || $databaseDelete = [0-9]* || $databaseDelete = *['!''@#/$\"*{^({+/|,};:~)`.%&.=-]>[<?']* || $databaseDelete = *" "* ]] ;then
   echo "  ---------------------- "
   echo "| Inavalid Databse Name |"
   echo "  ---------------------- "
   
elif [ -e $databaseDelete ] ;then
   echo " -------------- "
   echo "| Are You Sure |"
   echo " -------------- "
   select option in YES NO
   do
	case $option in
		YES )	
		    rm -r $databaseDelete
		    echo " --------------------- "
          echo "| Database is deleted |"
          echo " --------------------- "
		    
		    break
	        ;;
	        NO )	
		    echo " ------ "
          echo "| Okay |"
          echo " ------ "
          break
	        ;;
	     
	esac

   done
else 
   echo " ------------------------ "
   echo "| Database doesn't Exist |"
   echo " ------------------------ "
fi