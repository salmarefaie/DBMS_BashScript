#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob

echo " ----------------- "
echo "| Table update |"
echo " ----------------- "

echo " ------------- "
echo "| Your Tables |"
echo " ------------- "
ls -p | grep -v / | grep -v _

read -p "Enter your table name which you want to update from it: " updateTable

if [[ -z $updateTable || $updateTable == [0-9]* || $updateTable == *['!''@#/$\"*{^(+/|,;:~`.%&.=-]>[<?']* || $updateTable == *" "* ]] ;then
   echo " -------------------- "
   echo "| Inavalid Table Name |" 
   echo " -------------------- "

elif [ -f $updateTable ] ; then

        read -p "Enter field name you want to update : " fieldName
        if [[ -z $fieldName || $fieldName == [0-9]* || $fieldName == *['!''@#/$\"*{^(+/|,;:~`.%&.=-]>[<?']* || $fieldName == *" "* ]] ;then
        echo " -------------------- "
        echo "| Inavalid field Name |" 
        echo " -------------------- "

        elif [ -f $fieldName ] ;then
		 



































# read -p "Enter table Name: " tableName;
# if [[ -f $tableName ]]; then
# 	awk -F: '{if(NR==1){print $0}}' $tableName;
	
# 	read -p "Enter the column (PK) : " PK;
# 	read -p "Enter the value (PK) : " PKVal;
# 	read -p "Enter column to be updated : " Column;
# 	read -p "Enter new value : " newValue;
	 
#     awk -F:  '
# 	{
# 		if(NR==1){
# 			for(i=1;i<=NF;i++){
# 				if($i=="'$Column'")
#                 {
#                     var=i
#                     }
#                     else
#                     {
#                         if($i=="'$PK'")
#                         {
#                             vaa=i
#                             }
#                             }
# 			}
# 		}
# 		else{
# 			if($vaa=='$PKVal')
#             {
# 				$var=":'$newValue':"
# 			}
# 		}
# 		{print}
# 	}' $tableName > tmp && mv tmp $tableName;
	
#     else
# 	echo "$tableName doesn't exist";
# fi
