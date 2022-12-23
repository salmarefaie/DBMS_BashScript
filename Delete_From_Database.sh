#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob


echo " ---------------- "
echo "| Table Deletion"
echo " ---------------- "


echo "Available tables ";
ls -p | grep -v / | grep -v _


    select choice in "DeleteAll" "DeleteSpecificRow"  "Exit"
do
    case $choice in 
    "DeleteAll")
        while [ true ]
        do 
            read -p "Enter Table Name You want to delete From it: " tableName

            if [[ -z $tableName || $tableName == [0-9]* || $tableName == *['!''@#/$\"*{^(+/|,;:~`.%&.=-]>[<?']* || $tableName == *" "* ]] ;then
           
            echo "This table doesn't Exsit !!, Please enter another name."
            
            elif [[ -f $tableName ]];then

               sed -i '1,$d' $tableName
                echo "Content deleted"
                break 
            
            else
                echo "You Entered Invalid Table Name !!!"
                echo "Please Try Again!!"
            fi
        done
      
    ;;
    "DeleteSpecificRow")

        
    ;;
   
    "Exit")
        exit
    ;;
    *)
        echo "You Entered invalid Option"
    ;;
    esac

done
    