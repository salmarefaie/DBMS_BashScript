#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob

echo " ---------------- "
echo "| Table Creation |"
echo " ---------------- "
read -p "Enter your table name: " tableName

while [[ $tableName = $databaseName || -f $tableName || -z $tableName || $tableName == [0-9]* || $tableName == *['!''@#/$\"*{^({+/|,};:~)`.%&.=-]>[<?']* || $tableName == *" "* ]] 
do
   if [[ $tableName = $databaseName ]] ; then
      read -p "it is name of database, enter another name: " tableName

   elif [[ -f $tableName ]] ;then
      read -p "Table already exist, enter another name: " tableName

   else
      read -p "Inavalid Table Name, enter another name: " tableName
   fi
done

touch $tableName
touch "$tableName"_metadata""
echo " ------------------ "
echo "| Table is created |"
echo " ------------------ "

# enter num of colums and check regex for number not 0 or any thing except number
read -p "Enter number of fields for table: " number

while [[ $number == +([0]) || $number != +([0-9]) ]]
do
   if [[ $number == +([0]) ]] ;then
      read -p "you should add number for columns: " number  
   else 
      read -p "invalid number, please enter number of fields: " number
   fi
 done

echo " ---------------------------------------------------------------"
echo "| Table is created with $number columns and 1st column is primary key |"
echo " ---------------------------------------------------------------"

declare -a col_name
declare -a col_datatype

# enter name and datatype for columns and their regex and add to file
for (( i=0; i < $number ; i++ ))
do
   if (( $i == 0 )) ;then
      name="id"
      pk="true"
      dataType="int"
      echo "1st column is id, datatype is int and it is primart key"
      col_name+=($name)
      col_dataType+=($dataType)
      echo -n ${col_name[$i]} >> "./$tableName"_metadata""
   
   else
      pk="false"
      declare -i num
      num=$i+1

      read -p "enter the name of column num $num: " name


      while [[ ${col_name[*]} =~ $name || -z $name || $name == [0-9]* || $name == *['!''@#/$\"*{^({+/|,};:~)`.%&.=-]>[<?']* || $name == *" "* ]] 
      do
      if [[ ${col_name[*]} =~ $name ]] ;then
         read -p "Column exist, enter name of column num $num: " name
      else
         read -p "Invalid Name, enter valid name of column num $num: " name
      fi
      done

      col_name+=($name)

      echo -n :${col_name[$i]} >> "./$tableName"_metadata""


      echo "enter datatype of the column"
      select option in int string
      do
      case $option in 
      int )	
         dataType="int"
         break;
         ;;
         
      string )
         dataType="string"
         break;
         ;;
      esac
      done 
      
      col_dataType+=($dataType)
   fi
done

echo >> "./$tableName"_metadata""

# add name into metada file
for (( i=0 ; i < $number ; i++ ))
do 
   if (( $i == $number-1 )) ; then
      echo -n ${col_dataType[$i]} >> "./$tableName"_metadata""
   else
      echo -n ${col_dataType[$i]}: >> "./$tableName"_metadata""
   fi
done


echo " ------------------- "
echo "| MetaData is Added |"
echo " ------------------- "

# empty arrays
unset col_name[@]
unset col_dataType[@]























