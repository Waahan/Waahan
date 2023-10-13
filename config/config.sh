#! /bin/sh

echo "My configuration scipt"

isYes()
{
    input=$1

    if [ "$input" = "Y" ] || [ "$input" = "y" ] || [ "$input" = "yes" ]
        then
            return 1
    else
        return 0
    fi
}

addConfig()
{
    file=$1
    homeFile=$2
    shouldUse=$3

    local path=$(pwd)
    
    isYes $shouldUse
    shouldUse=$?

    if [ $shouldUse = 1 ]
        then
            ln -sf $path/$file ~/$homeFile
    fi
}

linkConfigFiles()
{
    useBash=$1
    useVim=$2
    useGit=$3

    addConfig ".bashrc" ".bashrc" $useBash
    addConfig ".vimrc" ".vimrc" $useVim
    addConfig ".gitconfig" ".gitconfig" $useGit
}

read -p "Use defaults or ask(y or n): " useDefaults

isYes $useDefaults

if [ $? = 1 ] 
    then 
        linkConfigFiles "y" "y" "y"
else
    read -p "Use bash(y or n): " useBash

    read -p "Use vim(y or n): " useVim
    
    read -p "Use git(y or n): " useGit
    
    linkConfigFiles $useBash $useVim $useGit
fi
