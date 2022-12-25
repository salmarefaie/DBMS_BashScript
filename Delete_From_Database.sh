echo " ----------------- "
echo "| Table Deletion |"
echo " ----------------- "

echo " ------------- "
echo "| Your Tables |"
echo " ------------- "
ls -p | grep -v / | grep -v _

read -p "Enter your table name which you want to Delete from it: " DeleteTable

if [[ -z $DeleteTable || $DeleteTable == [0-9]* || $DeleteTable == *['!''@#/$\"*{^(+/|,;:~`.%&.=-]>[<?']* || $DeleteTable == *" "* ]] ;then
   echo " -------------------- "
   echo "| Inavalid Table Name |" 
   echo " -------------------- "

elif [ -f $DeleteTable ] ; then
  select option in "Delete All" "Delete row" "Tables Menu"
  do
    case $option in 
    "Delete All")
        source ../../Delete_All.sh
       ;;
    


    
    "Delete row")
          source ../../Delete_Column.sh
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
