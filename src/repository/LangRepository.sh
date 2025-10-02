#!/bin/bash
#    .--.
#   |o_o |
#   |:_/ |
#  //   \ \
# (|     | )
# /'\_   _/`\
# \___)=(___/
# Script to create a lang in the database.
# @auth  : proteusvi@gmail.com
# @since : jeu. 18 sept. 2025 10:56:09 CEST

#+------------------------------------+
#| Liste content of table langue.     |
#| Return :                           |
#|   array : list of langs.           |
#+------------------------------------+
function listLang() {
    list=$(getListIdsFromTable bddFilms.langue)
    echo "${list[@]}"
}

#+--------------------------------+
#| Add a lang in the database.    |
#| Parameter :                    |
#|   $1 : libelle (string).       |
#|   $2 : abr (string).           |
#| Return    :                    |
#|   std output : id of lang (int)|
#+--------------------------------+
function addLang() {
    fields=('libelle' 'abr')
    values=("${@}")
    request=$(buildInsertIntoRequest langue 2 ${fields[@]} ${values[@]})
    mariadb -u${USER} -p${PASSWORD} -h${HOST} -P${PORT} ${NAME} -e "${request}"
    id=$(getLastIdFromTable langue)
    if [ "${id}" != "" ]; then
        mariadb -u${USER} -p${PASSWORD} -h${HOST} -P${PORT} ${NAME} -e "commit;"
    fi
    echo "${id}"
}

#+--------------------------------+
#| Get a lang by its id.          |
#| Parameter :                    |
#|   $1 : id (int).               |
#| Return    :                    |
#|   std output : lang (array).   |
#+--------------------------------+
function getLangById() {
    id="$1"
    results=( $(getRowFromTableById bddFilms.langue ${id}) )
    echo "${results[@]}"
}

#¼+--------------------------------+
#| Display a lang.                 |
#| Parameter :                     |
#|   $1 : lang (array).            |
#| Return    :                     |
#|   std output : none.            |
#+---------------------------------+
function displayLang() {
    lang=("${@}")
    echo "id      : ${lang[0]}"
    echo "libelle : ${lang[1]}"
    echo "abr     : ${lang[2]}"
}