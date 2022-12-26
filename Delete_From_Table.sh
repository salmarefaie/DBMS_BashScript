#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob

echo " -------------------------- "
echo "| Removing Data From Table |"
echo " -------------------------- "

echo " ------------- "
echo "| Your Tables |"
echo " ------------- "
ls -p | grep -v / | grep -v _

read -p "Enter your table name which you want to delete from it: " DeleteTable

if [[ -z $DeleteTable || $DeleteTable == [1-9]* || $DeleteTable == *['!''@#/$\"*{^(+/|,;:~`.%&.=-]>[<?']* || $DeleteTable == *" "* ]] ;then
   echo " -------------------- "
   echo "| Inavalid Table Name |" 
   echo " -------------------- "

elif [ -f $DeleteTable ] ; then
  select option in "Delete All Data" "Delete row Data" "Tables Menu"
  do
    case $option in 
    "Delete All Data")
        source ../../Delete_All.sh
       ;;
    
    "Delete row Data")
          source ../../Delete_row.sh
       ;;

    "Tables Menu")
       echo "  ----------------------- "
		 echo " | Return To Tables Menu |"
		 echo "  ----------------------- "
		 break
	     ;;
    esac

   done

else
   echo " --------------------- "
   echo "| Table doesn't Exist |"
   echo " --------------------- "
fi

