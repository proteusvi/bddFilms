#!/bin/bash
#    .--.
#   |o_o |
#   |:_/ |
#  //   \ \
# (|     | )
# /'\_   _/`\
# \___)=(___/
#Test file to create spaces after a text in a limited number of spaces autorised.
# @auth  : proteusvi@gmail.com
# @since : mer. 17 sept. 2025 08:34:50 CEST

# Load the libraries.
. src/script/UiInterfaceLibrary.sh
. tests/unit/DisplayResultTestLibrary.sh

displayResultTest "Test createSpacesForTitle 1 : Normal string." "         " "$(createSpacesForTitle 'Didier Beux and family.')"

displayResultTest "Test createSpacesForTitle 2 : Empty parameter." "                                " "$(createSpacesForTitle)" 

toCompare="\e[31mError :\e[0m\n"
toCompare="${toCompare}Title is equal or greater than 32 characters."
displayResultTest "Test createSpacesForTitle 4 : More than 32 character bis." \
"$(echo -en ${toCompare})" \
"$(createSpacesForTitle 'This phrase is greater than 32 characters.')"