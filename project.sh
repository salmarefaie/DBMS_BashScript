#!/usr/bin/bash

if [ -e "Database" ]; then
   echo " Database folder is exist "
   echo " -------------------------------------------------------"
   echo "| Hello in our Database engine, what do you want to do? |"
   echo " -------------------------------------------------------"
   cd Database
else
   echo "Database folder is created"
   echo " -------------------------------------------------------"
   echo "| Hello in our Database engine, what do you want to do? |"
   echo " -------------------------------------------------------"
   mkdir ./Database
   cd Database
fi


function Database_Menu(){
   select option in "Create Database" "List Databases" "Connect Database" "Drop Database" "Exit"
   do
	case $option in
	
		"Create Database" )	
		    source ../Create_DataBase.sh
	        ;;
	        
		"List Databases" )
		    source ../List_DataBases.sh
	        ;;
	        
		"Connect Database" )  
		    source ../Connect_DataBase.sh
		;;

		"Drop Database" )
		    source ../Drop_DataBase.sh
		;;
		
		Exit )
		 echo "  ---------------------------------- "
		 echo " | Bye Bye from our Database Engine |";
		 echo "  ---------------------------------- "
		 cd ..
		 break
	        ;;
	esac

   done


}
Database_Menu;

