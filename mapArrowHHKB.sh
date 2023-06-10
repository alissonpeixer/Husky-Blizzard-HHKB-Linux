#!/bin/sh
createdFile() {
    if [ -f "$arquivo" ]; then
        xmodmap $HOME/.Xmodmap
        echo "START..."
    else    
        styleSelect="false"

        echo "________________________________________"
        echo "Select to format: "
        echo "1 -  W A S D"
        echo "2 -  H J K L"
        echo "________________________________________"

        read style
        conteudo="NILL"

        if [ "$style" -eq 1 ]; then
            conteudo="
            keycode 105 = Caps_Lock
            keycode 66 = Mode_switch  
            keysym a = a A Left
            keysym s = s S Down
            keysym w = w W Up
            keysym d = d D Right
            "
            styleSelect="true"
        elif [ "$style" -eq 2 ]; then 
            conteudo="
            keycode 105 = Caps_Lock
            keycode 66 = Mode_switch  
            keysym h = h H Left
            keysym j = j J Down
            keysym k = k K Up
            keysym l = l L Right
            " 
            styleSelect="true"
        else
            echo "NotSelect"
        fi

        if [ "$styleSelect" = "true" ]; then
            echo "Created file..."
            arquivo=$HOME/.Xmodmap
            echo "$conteudo" > "$arquivo"
            echo "Arquivo criado e conteúdo adicionado com sucesso."
        fi

    fi
}



echo "________________________________________"
echo "Map Arrow keys for Linux using Xmodmap"
echo "Husky Blizzard Mechanical Keyboard"
echo "________________________________________"
echo "1 - Instalation MapScript"
echo "2 - Start  MAP"
echo "3 - Reload MAP"
echo "________________________________________"

read modo

arquivo="$HOME/.Xmodmap"

if [ "$modo" -eq 2 ]; then
    xmodmap $HOME/.Xmodmap
    echo "START..."
elif [ "$modo" -eq 3 ]; then
    setxkbmap br
    xmodmap $HOME/.Xmodmap
    echo "RELOAD..."
elif [ "$modo" -eq 1 ]; then
    createdFile
else
   echo "BY ALISSON PEIXER"
fi
