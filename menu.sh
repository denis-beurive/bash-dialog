#!/usr/bin/env bash

tmp_file=`tempfile 2> /dev/null` || tmp_file="/tmp/test${$}"
trap "echo \"Remove the temporary file ${tmp_file}\"; rm -f ${tmp_file}" 0 1 2 5 15

dialog --clear \
       --title "Menu box" \
       --menu "Please select a color:" 20 51 4 \
       "RED" "Red" \
       "GREEN" "Green" \
       "BLUE" "Blue" \
       "GREY" "Grey" \
       "YELLOW" "Yellow" 2> "${tmp_file}"

value=$?
choice=`cat ${tmp_file}`

case ${value} in
    0)   echo "Your choice: ${choice}";;
	1)   echo "The user canceled the operation";;
	255) echo "Choice: escape";;
esac