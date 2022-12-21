#!/usr/bin/bash

echo " ------------------- "
echo "| Database Removing |"
echo " -------------------"

read -p "Enter your database which you want to delete: " databaseDelete

if [ -e $databaseDelete ] ;then
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
