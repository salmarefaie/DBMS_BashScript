#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob

echo " ---------------- "
echo "| Your Databases |"
echo " ---------------- "
ls -F | grep "/"
