#!/usr/bin/env bash

dialog --clear \
       --title "Yes/No form" \
	   --yesno "This is a Yes/No form" 10 30

case $? in
	0)   echo "Choice: Yes";;
	1)   echo "Choice: No";;
	255) echo "Choice: escape";;
esac

