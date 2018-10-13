#!/usr/bin/env bash

file_path=$(readlink -e -- "$0")
script_path=$(dirname "$file_path")
cd $script_path


echo "################# Project Management ####################"
echo "Available Projects in $script_path:"
i=1
for entry in ./*
do
    if [ -d "$entry" ]; then
        if [ -e "$entry/.bashrc" ]; then

            owner=$(ls -ld . | awk 'NR==1 {print $3}')

            printf "%d) %-35s %s\n" $i "$entry" "$owner"
            
            proj_list=("${proj_list[@]}" "$entry")

            i=$((i+1))
        fi
    fi
done
echo "0) Abort"
echo "-1) Create New"
echo "#########################################################"
echo ""
read -p "Your selection: " num

# Exit the Program
if [ $num -eq 0 ]; then
    exit
fi

# Create New
if [ $num -eq -1 ]; then
    read -p "The Project Name: " name
    foldername="$(date +'%Y_%m_%d')_$name"
    if [ ! -e "./$foldername" ]; then
        mkdir $foldername
        cp .bashrc_template "./$foldername/.bashrc"
        sed -i "s/%PROJECTNAME%/$name/g" "./$foldername/.bashrc"
        cd $foldername
        git init
        echo ".bashrc" > ".gitignore"
        echo ".git*" >> ".gitignore"

        echo "[user]" > ".gitconfig"
        echo "	email = florianrenneke@gmail.com" >> ".gitconfig"
        echo "	name = Florian Renneke" >> ".gitconfig"

        mkdir bin
    fi
    exit
fi

# Create new Bash 
cd $(pwd)/${proj_list[(num-1)]}
bash --rcfile .bashrc


