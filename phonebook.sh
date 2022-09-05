#!/bin/bash
# Script to maintain a persistent phonebook

FILE=db_phonebook.txt

create_phonebook() {
    if ! [ -f "$1" ]; then
        touch $FILE   
    fi
}

add_item() {
    echo "$1 $2" >> $FILE 
}

create_phonebook $FILE

if [ $1 == "new" ]; 
then
    echo "new"
    add_item "$2" $3
else
    echo "other"
fi

