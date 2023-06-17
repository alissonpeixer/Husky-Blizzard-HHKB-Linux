#!/bin/sh
remove(){
    echo "Do you want to delete the current file? [y/n]"
    read next
    if [ "$next" = "y" ]; then
        rm $HOME/.Xmodmap
        sh ./mapArrowHHKB.sh
    fi
}
createdFile() {
    if [ -f "$arquivo" ]; then

        echo "Deseja apagar o arquivo atual? [y/n]"
        read next

        if [ "$next" = "y" ]; then
            rm $HOME/.Xmodmap
            sh ./mapArrowHHKB.sh
        fi

    else    
        styleSelect="false"

        echo "________________________________________"
        echo "Select to format: "
        echo "1 -  W A S D      "
        echo "2 -  H J K L      "
        echo "3 -  W A S D ? "" "
        echo "________________________________________"

        read style
        conteudo="NILL"

        if [ "$style" -eq 1 ]; then
            conteudo="
                keycode 105 = Caps_Lock
                keycode 66 = Mode_switch 
                keysym 9 = quotedbl
                keysym a = a A Left
                keysym s = s S Down
                keysym w = w W Up
                keysym d = d D Right
            "
            styleSelect="true"
            clear
        elif [ "$style" -eq 2 ]; then 
            conteudo="
            keycode 105 = Caps_Lock
            keycode 66 = Mode_switch 
            keycode 9 = quotedbl 
            keysym h = h H Left
            keysym j = j J Down
            keysym k = k K Up
            keysym l = l L Right
            " 
            styleSelect="true"
            clear  
        elif [ "$style" -eq 3 ]; then 
            conteudo="
                keycode 105 = Caps_Lock
                keycode 225 = Mode_switch
                keycode 66 = Mode_switch 
                keycode 9 = quotedbl
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
echo "4 - Remove MapScript"
echo "5 - Add to boot System Preferences"
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
elif [ "$modo" -eq 4 ]; then
    remove
elif [ "$modo" -eq 5 ]; then
    line_to_add="xmodmap .Xmodmap"
    if grep -Fxq "$line_to_add" $HOME/.bashrc; then
        echo "A linha já existe no arquivo ~/.bashrc."
    else
        # Adicionar a linha no arquivo
        echo "$line_to_add" >> $HOME/.bashrc
        echo "Linha adicionada com sucesso ao arquivo ~/.bashrc."
    fi
else
   echo "BY ALISSON PEIXER"
fi
