#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob



echo " ----------------- "
echo "| Table selection |"
echo " ----------------- "

echo " ------------- "
echo "| Your Tables |"
echo " ------------- "
ls -p | grep -v / | grep -v _

read -p "Enter your table name which you want to select from it: " selectTable

if [[ -z $selectTable || $selectTable = [0-9]* || $selectTable = *['!''@#/$\"*{^({+/|,};:~)`.%&.=-]>[<?']* || $selectTable = *" "* ]] ;then
   echo " -------------------- "
   echo "| Inavalid Table Name |" 
   echo " -------------------- "

elif [ -f $selectTable ] ; then
  select option in "Select All" "Select Row" "Select Field" "Select Column" "Tables Menu"
  do
    case $option in 
    "Select All")
        source ../../Select_All.sh
       ;;
    "Select Row")
          source ../../Select_Row.sh
         ;;


    "Select Field")
          source ../../Select_Field.sh
        ;;

    "Select Column")
          source ../../Select_Colomn.sh
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
