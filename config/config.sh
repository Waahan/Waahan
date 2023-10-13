#! /bin/sh

echo "My configuration scipt"

isYes()
{
    input=$1

    if [ "$input" = "Y" ] || [ "$input" = "y" ]
        then
            return 1
    else
        return 0
    fi
}

linkConfigFiles()
{
    useBash=$1
    useVim=$2
    useGit=$3

    if [ $useBash = 1 ]
        then
            ln -f .bashrc ~/.bashrc 
    fi

    if [ $useVim = 1 ]
        then
            ln -sf .vimrc ~/.vimrc
    fi

    if [ $useGit = 1 ]
            ln -sf .gitconfig ~/.gitconfig
    fi

}

read -p "Use defaults or ask(y or n): " useDefaults

isYes $useDefaults

if [ $? = 1 ] 
    then 
        linkConfigFiles 1 1
else
    read -p "Use bash(y or n): " useBash

    isYes $useBash
    useBash=$?

    read -p "Use vim(y or n): " useVim
    
    isYes $useVim
    useVim=$?

    read -p "Use git(y or n): " useGit
    
    isYes $useGit
    useGit=$?

    linkConfigFiles $useBash $useVim
fi
