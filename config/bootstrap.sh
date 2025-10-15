#! /bin/sh

printHelp()
{
    echo "Waahan's Bootstrap"
    echo "A simple script to install configuration files"
    echo ""
    echo "Usage: bootstrap.sh [options]"
    echo "  -h or --help    Print the help options"
    echo "  -y or --yes     Accept all config files to be installed"
}

# Parsing Arguments
ACCEPT_ALL=0

while [ $# -gt 0 ];
do
    case "$1" in
        -y|--yes)
            ACCEPT_ALL=1
            printf "Yes option recieved\n"
            shift 1
            ;;
        -h|--help)
            printHelp
            exit 0
            ;;
        *)
            break
            ;;
    esac
done

userAccept()
{
    prompt="$1"

    printf "%s" "$prompt"
    read -r userOption
    
    if [ "$userOption" = "y" ] || [ "$userOption" = "Y" ]
    then
        return "1"
    else
        return "0"
    fi
}

installFile()
{
    name="$1"
    fileName="$2"

    echo "Installing $name"

    if [ $ACCEPT_ALL != 1 ]
    then
        userAccept "Install $name(y or n): "
        promptResponse="$?"
    fi

    if [ $ACCEPT_ALL = 1 ] || [ $promptResponse = 1 ]
    then
        ln -sf "$PWD/$fileName" "$HOME/$fileName"
        echo "Install of $name successful"
    else
        echo "Not installing $name"
    fi
}

main()
{
    printf " _    _                _                   \n"
    printf "| |  | |              | |                  \n"
    printf "| |  | |  __ _   __ _ | |__    __ _  _ __  \n"
    printf "| |/\\| | / _\` | / _\` || '_ \\  / _\` || '_ \ \n"
    printf "\  /\  /| (_| || (_| || | | || (_| || | | |\n"
    printf " \/  \/  \__,_| \__,_||_| |_| \__,_||_| |_|\n"
    printf "\n"
    printf "Install configuration files script\n"
    printf "\n"

    installFile "bash" ".bashrc"
    installFile "vim" ".vimrc"
    installFile "git" ".gitconfig"
}

main
