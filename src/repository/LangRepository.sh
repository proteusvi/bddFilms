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

# Load the libraries.
. ../../src/library/DbInterfaceLibrary.sh


#+------------------------------------+
#| Liste content of table langue.     |
#| Return :                           |
#|   array : list of langs.           |
#+------------------------------------+
function listLang() {
    list=$(listTable bddFilms.langue)
    echo ${list[@]}
}

#+-------------------------------+
#| Display the actual content of |
#| lang.                         |
#+-------------------------------+
isAbrExist() {

}

#+--------------------------------+
#| Add a lang in the database.    |
#| Parameter :                    |
#|   $1 : libelle (string).       |
#|   $2 : abr (string).           |
#| Return    :                    |
#|   std output : result of       |
#|   insertion.                   |
#+--------------------------------+
function addLang() {
    fields=('libelle' 'abr')
    table="$1"
    shift 1
    values=("${@}")
    request=$(buildInsertIntoRequest langue 1 ${fields[@]} ${values[@]})
    mariadb -u${USER} -p${PASSWORD} -h${HOST} -P${PORT} ${NAME} -e "${request}"
}