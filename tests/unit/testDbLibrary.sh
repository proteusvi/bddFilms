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
source ../../src/library/DbInterfaceLibrary.sh
source ../../docker/.env

# Database credentials.
USER="${DB_USER}";
PASSWORD="${DB_PASSWORD}"
HOST="localhost"
NAME="${DB_NAME}"
PORT="13306"

test_requestHydratationFields() {
    listOfFileds=('champ1' 'champ2' 'champ3')
    sfields="$(requestHydratationFields ${listOfFileds[@]})"
    assert_equals "champ1, champ2, champ3" "${sfields}" "Erreur, la liste des champs est incorrecte"
}

test_requestHydratationValues() {
    listOfValues=('value1' 'value2' 'value3')
    svalues="$(requestHydratationValues ${listOfValues[@]})"
    assert_equals "\"value1\", \"value2\", \"value3\"" "${svalues}" "Erreur, la liste des valeurs est incorrecte"
}

test_insertIntoRequest() {
    listOfFileds=('champ1' 'champ2' 'champ3')
    listOfValues=('value1' 'value2' 'value3')
    sRequest="$(buildInsertIntoRequest "maTable" 3 ${listOfFileds[@]} ${listOfValues[@]})"
    assert_equals "INSERT INTO maTable ( champ1, champ2, champ3 ) VALUES ( \"value1\", \"value2\", \"value3\" );" "${sRequest}" "Erreur, la requête est incorrecte"
}

test_dbCredentials() {
    assert_not_equals "" "${USER}" "Erreur, la variable USER est vide"
    assert_not_equals "" "${PASSWORD}" "Erreur, la variable PASSWORD est vide"
    assert_not_equals "" "${HOST}" "Erreur, la variable HOST est vide"
    assert_not_equals "" "${NAME}" "Erreur, la variable NAME est vide"
    assert_not_equals "" "${PORT}" "Erreur, la variable PORT est vide"
}

test_listTable() {
    set f
    OIFS="$IFS"
    IFS=$'\ '
    local list=($(listTable bddFilms.langue))
    IFS="$OIFS"
    set +f
    assert_equals 5 ${#list[@]} "Erreur, le nombre d'éléments dans la liste est incorrect"
}
