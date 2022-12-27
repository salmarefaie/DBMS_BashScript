#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob

# metadata for table
col_selectArr=($(head -1 ./$selectTable"_metadata" | awk -F : '
   {
            fields=split($0, arr); 
            for (i=0;i<=fields;i++) print arr[i] 
   }

' ))

# num of columns for table
numSelectColumns=$(head -1 ./$selectTable"_metadata" | awk -F : '
{
      print NF
}
' )


# take id or name or ....
read -p "Enter name column which is selected row by it: " column