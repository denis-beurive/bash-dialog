#!/usr/bin/env bash

tmp_file=`tempfile 2> /dev/null` || tmp_file="/tmp/test${$}"
trap "echo \"Remove the temporary file ${tmp_file}\"; rm -f ${tmp_file}" 0 1 2 5 15

dialog --clear \
       --title "Input box" \
       --inputbox "Login:" 16 50 2> "${tmp_file}"

value=$?

case ${value} in
	0)   echo "Login: `cat ${tmp_file}`";;
	1)   echo "The user canceled the operation";;
	255) echo "Choice: escape";;
esac