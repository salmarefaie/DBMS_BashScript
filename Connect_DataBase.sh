#!/usr/bin/bash

echo " --------------------- "
echo "| Database Connection |"
echo " --------------------- "
ls -F | grep "/"
read -p "Enter your database name: " databaseName

if [ -e $databaseName ] ;then
   cd ./$databaseName 
   
   echo " ------------ "
   echo "| Table Menu |"
   echo " ------------ "

   select option in "Create Table" "List Tables" "Insert Table" "Select Table" "Update Table" "Drop Table" "Delete From Table" "Database Menu"
   do
	case $option in
	
		"Create Table" )	
		    source ../../Create_Table.sh
	        ;;
	        
		"List Tables" )
		    source .././List_DataBases.sh
	        ;;
	        
		"Insert Table" )  
		    source .././Connect_DataBase.sh
		;;

		"Select Table" )
		    source .././Drop_DataBase.sh
		;;
		
		"Update Table" )
		    source .././Drop_DataBase.sh
		;;
		
		"Drop Table" )
		    source .././Drop_DataBase.sh
		;;
		
		"Delete from Table" )
		    source .././Drop_DataBase.sh
		;;
		
		"Database Menu" )
		 echo "  -------------------- "
		 echo " | Your Database Menu |"
		 echo "  -------------------- "
		 cd ..
		 Database_Menu;
	        ;;
	esac

    done

else 
   echo " ------------------------ "
   echo "| Database doesn't exist |"
   echo " ------------------------ "
fi
