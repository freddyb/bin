#!/bin/sh
TMP="`zenity --entry --title='Zenity Locate' --text="Please enter search term"`"
locate -i $TMP | zenity --list --column='Files' --title='Results' --editable --height=600 --width=600
