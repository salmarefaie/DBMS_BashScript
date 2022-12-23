#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob



echo " ---------------- "
echo "| Table selection|"
echo " ---------------- "


echo "Available tables ";
ls -p | grep -v / | grep -v _


    select choice in "SelectAll" "SelectSpecificRow"  "Exit"
do
    case $choice in 
    "SelectAll")
        while [ true ]
        do 
            read -p "Enter Table Name You want to select From it: " tableName

            if [[ -z $tableName || $tableName == [0-9]* || $tableName == *['!''@#/$\"*{^(+/|,;:~`.%&.=-]>[<?']* || $tableName == *" "* ]] ;then
           
            echo "This table doesn't Exsit !!, Please enter another name."
            
            elif [[ -f $tableName ]];then

               sed -n '1,$p' $tableName
                echo " "
                break 
            
            else
                echo "You Entered Invalid Table Name !!!"
                echo "Please Try Again!!"
            fi
        done
      
    ;;
    "SelectSpecificRow")

        
    ;;
   
    "Exit")
        exit
    ;;
    *)
        echo "You Entered invalid Option"
    ;;
    esac

done
