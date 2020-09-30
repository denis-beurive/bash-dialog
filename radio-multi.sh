#!/usr/bin/env bash

tmp_file=`tempfile 2> /dev/null` || tmp_file="/tmp/test${$}"
trap "echo \"Remove the temporary file ${tmp_file}\"; rm -f ${tmp_file}" 0 1 2 5 15

dialog --clear \
       --backtitle "This is a backtitle" \
       --title "Radio box [single]" \
       --checklist "Please select one or more color(s):" 20 51 4 \
       "RED" "Red" off\
       "GREEN" "Green" on\
       "BLUE" "Blue" off\
       "GREY" "Grey" off\
       "YELLOW" "Yellow" off 2> "${tmp_file}"

value=$?
choice=`cat ${tmp_file}`

case ${value} in
    0)   echo "Your choice: ${choice}";;
	1)   echo "The user canceled the operation";;
	255) echo "Choice: escape";;
esac