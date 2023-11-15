#!/bin/sh

reloadMap="false"

logMenssage()
{

    if [ "$1" = "true"  ]; then
        echo "________________________________________"
        echo "Map Arrow keys for Linux using Xmodmap"
        echo "Husky Blizzard Mechanical Keyboard"
        echo "________________________________________"
        echo "1 - Instalation MapScript"
        echo "2 - Start  MAP"
        echo "3 - Reload MAP"
        echo "4 - Remove MapScript"
        echo "5 - Add to boot System Preferences"
        echo "6 - Set default map"
        echo "________________________________________"
    else
        echo "________________________________________"
        echo "Select to format: "
        echo "1 -  W A S D      "
        echo "2 -  H J K L      "
        echo "3 -  W A S D ? "" "
        echo "________________________________________"
    fi

    echo "BY ALISSON PEIXER"
    echo "________________________________________"
}



resetMap()
{
    setxkbmap br
    xmodmap $HOME/.Xmodmap
    echo "RELOAD..."
}

createdLocalFile()
{
    styleSelect="false"


    logMenssage "false"

    read style

    conteudo="NILL"

    if [ "$style" -eq 1 ]; then
        conteudo="
            keycode 9 = Escape quotedbl

            keycode 105 = Caps_Lock
            keycode 66 = Mode_switch

            remove Lock = Caps_Lock


            keysym a = a A Left
            keysym s = s S Down
            keysym w = w W Up questiondown question
            keysym d = d D Right

        "
        styleSelect="true"
        clear
    elif [ "$style" -eq 2 ]; then
        conteudo="

        keycode 9 = Escape quotedbl

        keycode 105 = Caps_Lock
        keycode 66 = Mode_switch

        remove Lock = Caps_Lock

        keysym h = h H Left
        keysym j = j J Down
        keysym k = k K Up
        keysym l = l L Right
        "
        styleSelect="true"
        clear
    elif [ "$style" -eq 3 ]; then
        conteudo="
            keycode 9 = Escape quotedbl

            keycode 105 = Caps_Lock
            keycode 66 = Mode_switch

            remove Lock = Caps_Lock

            keysym a = a A Left
            keysym s = s S Down
            keysym w = w W Up question question
            keysym d = d D Right
        "
    else
        echo "NotSelect"
    fi

    if [ "$styleSelect" = "true" ]; then
        echo "Created file..."
        arquivo=$HOME/.Xmodmap
        echo "$conteudo" > "$arquivo"
        echo "File created and content added successfully."
    fi

    if [ "$reloadMap" = "true" ]; then
        resetMap
    fi
}

remove()
{
    echo "Do you want to delete the current file? [y/n]"
    read next
    if [ "$next" = "y" ]; then
        rm $HOME/.Xmodmap
        sh ./mapArrowHHKB.sh
    fi
}

createdFile()
{
    if [ -f "$arquivo" ]; then

        echo "Do you want to delete the current file? [y/n]"
        read next

        if [ "$next" = "y" ]; then

            reloadMap="true"

            rm $HOME/.Xmodmap
            createdLocalFile
        else
            sh ./mapArrowHHKB.sh
        fi

    else
        createdLocalFile
    fi
}



logMenssage "true"

read modo

arquivo="$HOME/.Xmodmap"

if [[ ! "$modo" =~ ^[0-9]+$ ]]; then

   echo "Not Number..."
   sh ./mapArrowHHKB.sh

else

    if [ "$modo" -eq 2 ]; then
        xmodmap $HOME/.Xmodmap
        echo "START..."
    elif [ "$modo" -eq 3 ]; then
        setxkbmap br
        xmodmap $HOME/.Xmodmap
        echo "RELOAD..."
    elif [ "$modo" -eq 1 ]; then
        createdFile
    elif [ "$modo" -eq 4 ]; then
        remove
    elif [ "$modo" -eq 5 ]; then
        line_to_add="xmodmap .Xmodmap"
        if grep -Fxq "$line_to_add" $HOME/.bashrc; then
            echo "The line already exists in the file. ~/.bashrc."
        else
            # Adicionar a linha no arquivo
            echo "$line_to_add" >> $HOME/.bashrc
            echo "Line added successfully to the file. ~/.bashrc."
        fi
    elif [ "$modo" -eq 6 ]; then
        setxkbmap br
    else
    echo "BY ALISSON PEIXER"
    fi

fi



