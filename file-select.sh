#!/usr/bin/env bash

tmp_file=`tempfile 2> /dev/null` || tmp_file="/tmp/test${$}"
trap "echo \"Remove the temporary file ${tmp_file}\"; rm -f ${tmp_file}" 0 1 2 5 15

dialog --clear \
       --title "Select a ficle" \
       --fselect $HOME/ 14 48 2> "${tmp_file}"

value=$?
selection=`cat ${tmp_file}`
echo ${selection}



