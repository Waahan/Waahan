#! /bin/sh

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
    useZsh=$4

    addConfig ".bashrc" ".bashrc" $useBash
    addConfig ".vimrc" ".vimrc" $useVim
    addConfig ".gitconfig" ".gitconfig" $useGit
    addConfig ".zshrc" ".zshrc" $useZsh
}

interactive()
{
    read -p "Use defaults or ask(y or n): " useDefaults

    isYes $useDefaults

    if [ $? = 1 ] 
        then 
            linkConfigFiles "y" "y" "y"
    else
        read -p "Use bash(y or n): " useBash

        read -p "Use zsh(y or n): " useZsh

        read -p "Use vim(y or n): " useVim
    
        read -p "Use git(y or n): " useGit
    
        linkConfigFiles $useBash $useVim $useGit $useZsh
    fi
}

helpCommand()
{
    echo "NAME"
    echo "      config the basic config script"
    echo ""
    echo "OPTIONS"
    echo "      -i --interactive ask about configeration"
    echo "      -u --update update config"
}

update()
{
    echo "updating..."

    git pull origin master
}

findCommandArg()
{
    arg=$1

    if [ $arg = "--help" ] || [ $arg = "-h" ]
        then
            helpCommand
    elif [ $arg = "-i" ] || [ $arg = "--interactive" ]
        then
            interactive
    elif [ $arg = "-u" ] || [ $arg = "--update" ]
        then
            update
    else 
        echo "Error did not understand command"
    fi
}

echo -e "Wahan's config script"

if [ $# = 0 ] 
    then
        #By default run interactivly
        interactive
else 
    for arg in $@
        do
            findCommandArg $arg
    done
fi
