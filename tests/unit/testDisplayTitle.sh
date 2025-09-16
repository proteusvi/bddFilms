#!/bin/bash
# Load the library.
. src/script/UiInterfaceLibrary.sh
. tests/unit/DisplayResultTestLibrary.sh

# Test title "Create film"
displayResultTest "displayTitle 1" "+---------------------------------+
# Create film                     #
+---------------------------------+" "$(displayTitle 'Create film')"
# Test title "Create serie"
displayResultTest "displayTitle 2" "+---------------------------------+
# Create serie                    #
+---------------------------------+" "$(displayTitle 'Create serie')"
# Test title "Create season"
displayResultTest "displayTitle 3" "+---------------------------------+
# Create season                   #
+---------------------------------+" "$(displayTitle 'Create season')"
# Test title "Create episode"
displayResultTest "displayTitle 4" "+---------------------------------+
# Create episode                  #
+---------------------------------+" "$(displayTitle 'Create episode')"
# Test title Didier Beux et sa famille."
displayResultTest "displayTitle 5" "+---------------------------------+
# Didier Beux et sa famille.      #
+---------------------------------+" "$(displayTitle 'Didier Beux et sa famille.')"
# Test title empty"
displayResultTest "displayTitle 6" "+---------------------------------+
#                                 #
+---------------------------------+" "$(displayTitle)"