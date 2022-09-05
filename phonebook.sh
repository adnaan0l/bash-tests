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

list_phonebook(){
    cat $FILE 
}

clear_phonebook() {
    > $FILE 
}

create_phonebook $FILE

if [ $1 == "new" ]; 
then
    echo "Adding "$2" $3"
    add_item "$2" $3
elif [ $1 == "list" ];
then
    echo "Listing phonebook items..."
    list_phonebook
elif [ $1 == "clear" ];
then
    echo "clear"
    clear_phonebook
elif [ $1 == "lookup" ];
then
    echo "lookup"
    sed -n "/$2/p" $FILE
else
    echo "other"
fi

