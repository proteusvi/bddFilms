#!/bin/bash
#    .--.
#   |o_o |
#   |:_/ |
#  //   \ \
# (|     | )
# /'\_   _/`\
# \___)=(___/
# Test sql result to array conversion.
# @auth  : proteusvi@gmail.com
# @since : mer. 01 oct. 2025 10:17:13 CEST

# Load the libraries.
. ../../docker/.env
. ../../src/library/DbInterfaceLibrary.sh
. ../../src/repository/LangRepository.sh

idsLangResults=()

#+---------------------------------------+
#| Drop the database if exists.          |
#+---------------------------------------+
function dropDatabase() {
    mariadb -u${DB_USER} -p${DB_PASSWORD} -hlocalhost -P13306 -e "DROP DATABASE IF EXISTS bddFilms;"
}

#+---------------------------------------+
#| Create the database if not exists.    |
#+---------------------------------------+
function createDatabase() {
    mariadb -u${DB_USER} -p${DB_PASSWORD} -hlocalhost -P13306 -e "CREATE DATABASE IF NOT EXISTS bddFilms CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;"
}

#+---------------------------------------+
#| Fill the language table.              |
#+---------------------------------------+
function fillLanguageTable() {
    idsLangResults[0]="$(addLang 'Français' 'fr')"
    idsLangResults[1]="$(addLang 'Anglais' 'en')"
    idsLangResults[2]="$(addLang 'Allemand' 'de')"
    idsLangResults[3]="$(addLang 'Italien' 'it')"
    idsLangResults[4]="$(addLang 'Japonais' 'ja')"
}  

#+---------------------------------------+
#| Initialize the database.              |
#| Drop, create and fill the database.   |
#+---------------------------------------+
function iniDatabase() {
    dropDatabase
    createDatabase
    mariadb -u${DB_USER} -p${DB_PASSWORD} -hlocalhost -P13306 bddFilms < ../../sql/database-create.sql
    fillLanguageTable
}

iniDatabase

test_listIdsFromTable() {
    results=( $(getListIdsFromTable bddFilms.langue) )
    assert_equals 6 ${#results[@]} "Erreur, le nombre d'éléments dans le tableau est incorrect"
    assert_equals "${idsLangResults[0]}" "${results[1]}" "Erreur, le premier élément du tableau est incorrect"
    assert_equals "${idsLangResults[1]}" "${results[2]}" "Erreur, le deuxième élément du tableau est incorrect"
    assert_equals "${idsLangResults[2]}" "${results[3]}" "Erreur, le troisième élément du tableau est incorrect"
    assert_equals "${idsLangResults[3]}" "${results[4]}" "Erreur, le quatrième élément du tableau est incorrect"
    assert_equals "${idsLangResults[4]}" "${results[5]}" "Erreur, le cinquième élément du tableau est incorrect"
}

test_getListLang() {
    results=( $(listLang) )
    assert_equals 6 ${#results[@]} "Erreur, le nombre d'éléments dans le tableau est incorrect"
    assert_equals "${idsLangResults[0]}" "${results[1]}" "Erreur, le premier élément du tableau est incorrect"
    assert_equals "${idsLangResults[1]}" "${results[2]}" "Erreur, le deuxième élément du tableau est incorrect"
    assert_equals "${idsLangResults[2]}" "${results[3]}" "Erreur, le troisième élément du tableau est incorrect"
    assert_equals "${idsLangResults[3]}" "${results[4]}" "Erreur, le quatrième élément du tableau est incorrect"
    assert_equals "${idsLangResults[4]}" "${results[5]}" "Erreur, le cinquième élément du tableau est incorrect"
}