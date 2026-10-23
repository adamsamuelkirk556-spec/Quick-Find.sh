#!/bin/bash

#READ ME
#this is a script to help optimize your file search.
#simply input your file name and directory(optional, the default will search root
#depenency fzf.  please be sure to install or remove pipe on line #18

while true; do
    read -r -p "Enter file name: " file_name
    read -r -p "Enter directory (optional, default /): " dir_local


    search_dir="${dir_local:-/}"

    echo "Searching for '*${file_name}*' in '$search_dir'..."
    echo "==================================================="

    results=$(find "$search_dir" -name "*${file_name}*" 2>/dev/null | fzf)

    if [ -n "$results" ]; then
        echo "Here is everything we could find:"
        echo "$results"
    else
        echo "Cannot locate. Ensure correct spelling and capitalization."
    fi

    echo
    read -r -p "Search again? (y/n): " again
    [[ "$again" != [yY] ]] && break
    echo "==============================================================="
done
