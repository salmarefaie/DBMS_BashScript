#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob

echo " -------------- "
echo "| Table Update |"
echo " -------------- "

echo " ------------- "
echo "| Your Tables |"
echo " ------------- "
ls -p | grep -v / | grep -v _

read -p "Enter your table name which you want to update it: " updateTable

if [[ -z $updateTable || $updateTable = [0-9]* || $updateTable = *['!''@#/$\"*{^({+/|,};:~)`.%&.=-]>[<?']* || $updateTable = *" "* ]] ;then
   echo " -------------------- "
   echo "| Inavalid Table Name |" 
   echo " -------------------- "

elif [ -f $updateTable ] ; then
            # metadata for table
        col_updateArr=($(head -1 ./$updateTable"_metadata" | awk -F : '
        {
                    fields=split($0, arr); 
                    for (i=0;i<=fields;i++) print arr[i] 
        }
        ' ))
        

        # num of columns for table
        numUpdateColumns=$(head -1 ./$updateTable"_metadata" | awk -F : '
        {
            print NF
        }
        ' )

        # metadata datatype for table
        colUpdateArr_type=($(tail -1 ./$updateTable"_metadata" | awk -F : '
        {
                    fields=split($0, arr); 
                    for (i=0;i<=fields;i++) print arr[i] 
        }
        ' ))

        # take id or name or ....
        read -p "Enter name column which is updated row by it(condition): " column

        # check regex column name
        if [[ -z $column || $column = [0-9]* || $column = *['!''@#/$\"*{^(+/|,;:~`.%&.=-]>[<?']* || $column = *" "* ]] ;then
        echo " ---------------------- "
        echo "| Inavalid Column Name |" 
        echo " ---------------------- "

        declare -i index         # num of column for table

        # check lw mwgood fy table metadata
        elif [[ ${col_updateArr[*]} =~ $column ]] ; then

            # bageeb num of column for table
            for (( i=1; i <= $numUpdateColumns ; i++ ))
            do 
                if [[ "${col_updateArr[i-1]}" == "$column" ]] ; then
                    index=$i
                    type=${colUpdateArr_type[$index-1]}
                fi
            done

            # take value of column to select this row
            read -p "Enter value of column which is updated row by it(condition): " column_value

            # check type to take true value
            if [[ "$type" = "int" ]] ;then

                while [[ $column_value == +([0]) || $column_value != +([0-9]) ]]
                do 
                read -p " Invalid Value, you should enter an integer value(condition): " column_value
                done

                row_num=`awk -F : '
                    {
                    if($'$index'=='$column_value'){print NR}
                    }
                    ' "./$updateTable"` 
                

            elif [[ "$type" == "string" ]] ;then
                while [[ -z $column_value || $column_value = [0-9]* || $column_value = *['!''@#/$\"*{^({+/|,};:~)`.%&.=-]>[<?']* || $column_value = *" "* ]]
                do 
                read -p " Invalid Value, you should enter a string value(condition): " column_value
                done

                row_num=`awk -F : '
                    {
                    if($'$index'=="'$column_value'"){print NR}
                    }
                    ' "./$updateTable"` 
            fi
             
            if [[ ! -z $row_num ]] ; then

                    declare -i field_index         # num of column for table
                    read -p "Enter name column which is updated in the row(set new value): " field

                    if [[ -z $field || $field == [0-9]* || $field == *['!''@#/$\"*{^(+/|,;:~`.%&.=-]>[<?']* || $field == *" "* ]] ;then
                    echo " ---------------------- "
                    echo "| Inavalid Column Name |" 
                    echo " ---------------------- "

                    # check lw mwgood fy table metadata
                    elif [[ ${col_updateArr[*]} =~ $field ]] ; then

                        # bageeb num of column for table
                    for (( i=1; i <= $numUpdateColumns ; i++ ))
                    do 
                        if [[ "${col_updateArr[i-1]}" == "$field" ]] ; then
                            field_index=$i
                            type=${colUpdateArr_type[$field_index-1]}
                        fi
                    done
                    
                    old_value=`sed -n ''$row_num' p' ./$updateTable | cut -d":" -f $field_index`
                    

                    # take value of column to select this row
                    read -p "Enter value of column which is updated in the row(set new value): " new_value

                    # check type to take true value
                    if [[ "$type_new" = "int" ]] ;then

                        while [[ $column_value == +([0]) || $column_value != +([0-9]) ]]
                        do 
                        read -p " Invalid Value, you should enter an integer value(set new value): " new_value
                        done


                    elif [[ "$type_new" == "string" ]] ;then
                        while [[ -z $column_value || $column_value = [0-9]* || $column_value = *['!''@#/$\"*{^({+/|,};:~)`.%&.=-]>[<?']* || $column_value = *" "* ]]
                        do 
                        read -p " Invalid Value, you should enter a string value(set new value): " new_value
                        done

                    fi
                    
                    sed -i 's/'$old_value'/'$new_value'/g' ./$updateTable
                    


                    # column name m4 mwgood
                    else
                    echo " ---------------------- "
                    echo "| Column doesn't Exist |"
                    echo " ---------------------- "
                    fi
            else
            echo " ------------------------------- "
            echo "| Value of Column doesn't Exist |"
            echo " ------------------------------- "
            fi  

        
        # column name m4 mwgood
        else
        echo " ---------------------- "
        echo "| Column doesn't Exist |"
        echo " ---------------------- "

        fi

else
   echo " --------------------- "
   echo "| Table doesn't Exist |"
   echo " --------------------- "
fi



