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

delete_items() {
    sed -i "/$1/d" $FILE
}

get_items() {
    sed -n "/$1/p" $FILE
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
    echo "Clearing phonebook..."
    clear_phonebook
elif [ $1 == "lookup" ];
then
    echo "Getting matches for $2."
    get_items $2
elif [ $1 == "remove" ];
then
    echo "Removing all matches for $2."
    delete_items $2
else
    echo "Invalid operation."
fi

