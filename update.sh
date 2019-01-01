#!/bin/sh

# A sript that copies relevant dotfiles to the current directory so it can be saved in github

set -e

display_done() {
    NEW=$1
    CURRENT=$2
    TYPE=$3
    echo [$TYPE] $CURRENT =\> updated with $NEW
}

mkdir_if_needed() {
    CURRENT_FILE=$1
    case "$CURRENT_FILE" in
    */* ) 
        DIRECTORY=$(echo $1 | sed 's/\(.*\)\/.*/\1/')
        if [ ! -d $DIRECTORY ]; then
            echo Create directory $DIRECTORY
            mkdir -p $DIRECTORY
        fi
    esac
}

update() {
    NEW_FILE=$1
    CURRENT_FILE=$(echo $1 | sed 's/\/home\/[a-z]*\///')
    TYPE=$2
    
    mkdir_if_needed $CURRENT_FILE
    cp $NEW_FILE $CURRENT_FILE
    display_done $NEW_FILE $CURRENT_FILE $TYPE
}

update_dir() {
    NEW=$1
    CURRENT=$(echo $1 | sed 's/\/home\/[a-z]*\///')
    TYPE=$2

    if [ ! -d $NEW ]; then
         mkdir -p $NEW
    fi

    cp -R $NEW .
    display_done $NEW $CURRENT $TYPE
}

echo "Start updating dotfiles..."
update ~/.zshrc omyzsh
update_dir ~/.fonts fonts
update_dir ~/.avatar avatar
update ~/.config/compton.conf compton
update_dir ~/.config/i3 i3
update_dir ~/.config/i3lock i3lock
update_dir ~/.config/polybar polybar
update_dir ~/.config/rofi rofi
echo "Done!"

