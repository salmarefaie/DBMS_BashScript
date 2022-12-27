#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob

echo " -------------- "
echo "| Are You Sure |"
echo " -------------- "
select option in YES NO
do
  case $option in
    YES )	
        sed -i '1,$d' $DeleteTable
        echo " -------------------------------- "
        echo "| All Data From Table is Deleted |"
        echo " -------------------------------- "
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

break