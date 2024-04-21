#!/bin/bash

custom_commands=("" "cllear" "peak")
commands_to_install=()

# Parse command line arguments
for arg in "$@"; do
    # echo "$arg"
    case $arg in
        -all)
            # If -all is specified, install all custom commands
            unset commands_to_install[@]
            commands_to_install=("${custom_commands[@]:1}")
            #echo "Installing all commands: ${commands_to_install[@]}"
            ;;
        *)
            # Assume any other argument is a specific command to install
            commands_to_install+=("$arg")
            ;;
    esac
done

# Output the final list of commands to install
# for arg in "${commands_to_install[@]}"; do
#     echo "-  $arg"
# done


compile(){
    # making the build folder
    if [ ! -d "./build" ]; then
        echo "Did not detect build directory"
        mkdir build/
    fi
    # compiling the custom commands and moving the binaries to build/
    for command in "${commands_to_install[@]}"; do
        if [ "$command" = "cllear" ]; then
            echo "compiling for $command"
            g++ -o cllear cllear_cpp/cllear.cpp
            mv cllear build/
        elif [ "$command" = "peak" ]; then
            echo "compiling for $command"
            g++ -o peak peak_cpp/peak.cpp
            mv peak build/
        fi
    done

    return 0
}


check_file_then_compile() {
    if [ ! -f "build/$1" ]; then
        compile "$1"
    fi
    # echo "File exists"
    return 0
}

install(){
    # It compileds and then it moves the custom commands to ~/.local/bin
    for command in "${commands_to_install[@]}"; do
        if [ "$command" = "cllear" ]; then
            echo "installing cllear"
            check_file_then_compile "$command"
            cp build/cllear ~/.local/bin/

        elif [ "$command" = "peak" ]; then
            echo "installing peak"
            check_file_then_compile "$command"
            cp build/peak ~/.local/bin/   
        fi
    done

    echo "Installing has been completed"
    return 0
}

setup(){
    compile "${custom_commands[@]}"
    install "${custom_commands[@]}"
    return 0
}

remove(){
    for command in ${custom_commands[@]}; do
        echo "Removing command: $command"
        rm ~/.local/bin/$command
    done

    echo "Removing has been completed."
    return 0
}

# ${commands_to_install[@]}




if [ "${1,,}" = "-all" ]; then
    setup 
elif [ "${1,,}" = "-install" ]; then 
    install "${commands_to_install[@]}"
elif [ "${1,,}" = "-remove" ]; then 
    remove
elif [ "${1,,}" = "-compile" ]; then 
    compile "${commands_to_install[@]}"
elif [ "${1,,}" = "-help" ]; then 
    echo " Installer -help page:"
	echo "	-all : installs and setups everything"
	echo "	-install : installs only the command you want"
	echo "	-remove : removes the commands from your system"
    echo "	-compile : compile only some of the commands (you will find the compiled commands in build/)"
	echo "	-help : to get help, this message"
else
	echo "No clue what you said, type -help do get some help :)"
fi