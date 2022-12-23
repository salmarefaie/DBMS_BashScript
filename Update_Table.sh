#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob
echo "Available tables ";
ls -p | grep -v / | grep -v _ ;
read -p "Enter table Name: " tableName;
if [[ -f $tableName ]]; then
	awk -F: '{if(NR==1){print $0}}' $tableName;
	read -p "Enter column to be updated : " Column;
	read -p "Enter new value : " newValue;
	read -p "Enter the column (PK) : " PK;
	read -p "Enter the value (PK) : " PKVal; 
    awk -F:  '
	{
		if(NR==1){
			for(i=1;i<=NF;i++){
				if($i=="'$Column'"){var=i}else{if($i=="'$PK'"){vaa=i}}
			}
		}
		else{
			if($vaa=='$PKVal'){
				$var=":'$newValue':"
			}
		}
		{print}
	}' $tableName > tmp && mv tmp $tableName;
	
    else
	echo "$tableName doesn't exist";
fi
