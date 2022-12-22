#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob

echo " ---------------- "
echo "| Table Removing |"
echo " ---------------- "

ls -p | grep -v / | grep -v _

read -p "Enter your table which you want to delete: " tableDelete

if [[ -z $tableDelete || $tableDelete == [0-9]* || $tableDelete == *['!''@#/$\"*{^(+/|,;:~`.%&.=-]>[<?']* || $tableDelete == *" "* ]] ;then
   echo "  -------------------- "
   echo "| Inavalid Table Name |"
   echo "  -------------------- "
   
elif [ -f $tableDelete ] ;then
   echo " -------------- "
   echo "| Are You Sure |"
   echo " -------------- "
   select option in YES NO
   do
	case $option in
		YES )	
		    rm $tableDelete
		    rm "$tableDelete"_metadata""
		    echo " ------------------ "
                    echo "| Table is deleted |"
                    echo " ------------------ "
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
   echo " --------------------- "
   echo "| Table doesn't Exist |"
   echo " --------------------- "
fi
