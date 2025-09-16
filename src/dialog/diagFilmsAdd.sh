#!/bin/bash
# useradd1.sh - A simple shell script to display the form dialog on screen
# set field names i.e. shell variables
title=""
subtitle=""
language=""
titleVo=""
description0=""
description1=""
description2=""
description3=""
director=""

# open fd
exec 3>&1

# Store data to $VALUES variable
VALUES=$(dialog --ok-label "Submit" \
	  --backtitle "Add a film" \
	  --title "Filmadd" \
	  --form "Create a new film" \
15 80 0 \
	"Titre:" 1 1	"$title" 	1 15 32 0 \
	"Sous Titre:" 2 1	"$subtitle" 	2 15 32 0 \
	"Date (année):" 3 1	"$subtitle" 	3 15 6 0 \
	"Langue:" 4 1	"$subtitle" 	4 15 4 0 \
	"Titre VO:" 5 1	"$titleVo" 	5 15 32 0 \
	"Description:" 6 1	"$description0" 	6 15 32 0 \
	"" 7 1	"$description1" 	7 15 32 0 \
	"" 8 1	"$description2" 	8 15 32 0 \
	"" 9 1	"$description3" 	9 15 32 0 \
	"Réalisateur:" 10 1	"$director" 	10 15 32 0 \
2>&1 1>&3)

# close fd
exec 3>&-
clear
# display values just entered
echo "$VALUES"
