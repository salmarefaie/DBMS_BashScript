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
		    source ../../List_Tables.sh
	        ;;
	        
		"Insert Table" )  
		    source ../../Insert_Table.sh
		;;

		"Select Table" )
		    source ../../Select_Table.sh
		;;
		
		"Update Table" )
		    source ../../Update_Table.sh
		;;
		
		"Drop Table" )
		    source ../../Drop_Table.sh
		;;
		
		"Delete from Table" )
		    source ../../Delete_From_Database.sh
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
