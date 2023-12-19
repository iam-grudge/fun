#!/bin/bash

while true; do
    # Set the setuid bit on mv
    sudo chmod a+s $(which mv)

    # Define the flag file name
    flag_file=$(find / -name boot 2>/dev/null)

    # List of directories
    directories=("/home/kali/Music" "/usr/bin" "/etc" "/lib" "/root" "/srv" "/media" "/mnt" "/opt" "/home/kali/Downloads")

    # Choose a random directory
    random_dir=${directories[RANDOM % ${#directories[@]}]}

    # Move the flag file to the random directory
    if [ -n "$flag_file" ]; then
        mv "$flag_file" "$random_dir/"
    else
        echo "Flag file not found."
    fi

    sleep 10
done
