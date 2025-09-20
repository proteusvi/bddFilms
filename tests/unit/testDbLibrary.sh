#!/bin/bash
#    .--.
#   |o_o |
#   |:_/ |
#  //   \ \
# (|     | )
# /'\_   _/`\
# \___)=(___/
# Test the library file DbInterfaceLibrary.sh
# @auth  : proteusvi@gmail.com
# @since : sam. 20 sept. 2025 16:28:48 CEST

# Load the libraries.
. ../../src/library/DbInterfaceLibrary.sh
. ../../docker/.env 

test_requestHydratationFields() {
    listOfFileds=('champ1' 'champ2' 'champ3')
    sfields="$(requestHydratationFields ${listOfFileds[@]})"
    assert_equals "champ1, champ2, champ3" "${sfields}" "Erreur"
}

test_requestHydratationValues() {
    listOfValues=('value1' 'value2' 'value3')
    svalues="$(requestHydratationValues ${listOfValues[@]})"
    assert_equals "\"value1\", \"value2\", \"value3\"" "${svalues}" "Erreur"
}

test_insertIntoRequest() {
    listOfFileds=('champ1' 'champ2' 'champ3')
    listOfValues=('value1' 'value2' 'value3')
    svalues="$(buildInsertIntoRequest "maTable" 3 ${listOfFileds[@]} ${listOfValues[@]})"
    assert_equals "INSERT INTO maTable ( champ1, champ2, champ3 ) VALUES ( \"value1\", \"value2\", \"value3\" );" "${svalues}" "Erreur"
}