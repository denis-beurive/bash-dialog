#!/usr/bin/env bash

choice=`dialog --clear \
        --stdout \
        --backtitle "This is a backtitle" \
        --title "Radio box [single]" \
        --radiolist "Please select a color:" 20 51 4 \
        "RED" "Red" off \
        "GREEN" "Green" on \
        "BLUE" "Blue" off \
        "GREY" "Grey" off \
        "YELLOW" "Yellow" off`

echo "Your choice: ${choice}"
