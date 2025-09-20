#!/bin/bash
#    .--.
#   |o_o |
#   |:_/ |
#  //   \ \
# (|     | )
# /'\_   _/`\
# \___)=(___/
# Test library file UiInterfaceLibrary.sh.
# @auth  : proteusvi@gmail.com
# @since : mer. 17 sept. 2025 08:36:26 CEST

# Load the libraries.
. ../../src/library/UiInterfaceLibrary.sh
#. DisplayResultTestLibrary.sh

test_displayTitle_Create_film() {
    assert_equals "+---------------------------------+
# Create film                     #
+---------------------------------+" "$(displayTitle 'Create film')" "Create film en erreur"
}

test_displayTitle_Create_serie() {
    assert_equals "+---------------------------------+
# Create serie                    #
+---------------------------------+" "$(displayTitle 'Create serie')" "Create série Erreur"
}

test_displayTitle_Create_season() {
    assert_equals "+---------------------------------+
# Create season                   #
+---------------------------------+" "$(displayTitle 'Create season')" "Create season en Erreur"
}
test_displayTitle_Create_episode() {
    assert_equals "+---------------------------------+
# Create episode                  #
+---------------------------------+" "$(displayTitle 'Create episode')" "Create episode en Erreur"
}
test_displayTitle_More_than_32_characters() {
    toCompare="\e[31mError :\e[0m\n"
    toCompare="${toCompare}Title is equal or greater than 32 characters."
    assert_equals "$(echo -en ${toCompare})" \
    "$(displayTitle 'This phrase is greater than 32 characters.')" \
    "Message greater than 32 characters en erreur"
}
test_displayTitle_Title_is_empty() {
    assert_equals "+---------------------------------+
#                                 #
+---------------------------------+" "$(displayTitle)" "Title is empty en erreur"
}

test_createSpacesForTitle_Normal_string() {
    assert_equals "         " "$(createSpacesForTitle 'Didier Beux and family.')" "Normal string en erreur"
}

test_createSpacesForTitle_Empty_parameter() {
    assert_equals "                                " "$(createSpacesForTitle)" "Empty parameter en erreur"
}

test_createSpacesForTitle_More_than_32_characters() {
    toCompare="\e[31mError :\e[0m\n"
    toCompare="${toCompare}Title is equal or greater than 32 characters."
    assert_equals "$(echo -en ${toCompare})" \
    "$(createSpacesForTitle 'This phrase is greater than 32 characters.')" \
    "More than 32 character en erreur"
}
