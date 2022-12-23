#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob

echo " ---------"
echo "| insert|"
echo " ---------"
read -p "Enter your table name: " tableName

while [[ -z $tableName || $tableName == [0-9]* || $tableName == *['!''@#/$\"*{^(+/|,;:~`.%&.=-]>[<?']* || $tableName == *" "* ]] 
do
   read -p "Inavalid Table Name, enter another name: " tableName
done


until [ -f $tableName ]
do
   read -p "Table name already exist, enter another name: " tableName
done
  

 for (( i=1; i <= ${col_name[*] ; i++ ))
 
      do
        IFS=':' read -r -a column <<< "${lines[i]}";
        col_name=${column[0]};
        col_DataType=${column[1]};
        
     if [[ $i == 0 ]]; then
                newRecord=$newColValue;
            else
                newRecord="$newRecord:$newColValue";
            fi

           echo" newRecord"


        done


        echo -n $newRecord


}

























