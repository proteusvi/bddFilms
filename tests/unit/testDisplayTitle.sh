#!/bin/bash
#    .--.
#   |o_o |
#   |:_/ |
#  //   \ \
# (|     | )
# /'\_   _/`\
# \___)=(___/
# Test file for a create title in a limited space.
# @auth  : proteusvi@gmail.com
# @since : mer. 17 sept. 2025 08:36:26 CEST

# Load the libraries.
. src/library/UiInterfaceLibrary.sh
. tests/unit/DisplayResultTestLibrary.sh


displayResultTest "displayTitle 1 : Create film." "+---------------------------------+
# Create film                     #
+---------------------------------+" "$(displayTitle 'Create film')"

displayResultTest "displayTitle 2 : Create serie." "+---------------------------------+
# Create serie                    #
+---------------------------------+" "$(displayTitle 'Create serie')"

displayResultTest "displayTitle 3 : Create season." "+---------------------------------+
# Create season                   #
+---------------------------------+" "$(displayTitle 'Create season')"

displayResultTest "displayTitle 4 : Create episode." "+---------------------------------+
# Create episode                  #
+---------------------------------+" "$(displayTitle 'Create episode')"

toCompare="\e[31mError :\e[0m\n"
toCompare="${toCompare}Title is equal or greater than 32 characters."
displayResultTest "displayTitle 5 : More than 32 characters." \
"$(echo -en ${toCompare})" \
"$(displayTitle 'This phrase is greater than 32 characters.')"

displayResultTest "displayTitle 6 : Title is empty." "+---------------------------------+
#                                 #
+---------------------------------+" "$(displayTitle)"