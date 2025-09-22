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
    set f
    OIFS="$IFS"
    IFS=$'\ '
    local list=($(listIdsFromTable bddFilms.langue))
    IFS="$OIFS"
    set +f
    echo ${list[@]}
}

#+------------------------------------+
#| Add a lang in the table langue.    |
#| Parameter :                        |
#|   libelle : libelle of lang.       |
#|   abr     : abr of lang.           |
#| Return    :                        |
#|   std output : id of lang (int).   |
#+------------------------------------+
function addLang() {
    fields=('libelle' 'abr')
    table="langue"
    values=("${@}")

    request=$(buildInsertIntoRequest ${table} 2 ${fields[@]} ${values[@]})
    mariadb -u${USER} -p${PASSWORD} -h${HOST} -P${PORT} ${NAME} -e "${request}"

    echo "$(getIdFromTableByField langue libelle ${values[0]})"
}

getLangById() {
    id=${1}
    local result=($(getRowFromTableById langue ${id}))
    libelle=${result[4]}
    abr=${result[5]}
    setLanguage ${id} ${libelle} ${abr}
    echo $(getLanguage)
}

function displayListLang() {
    set f
    OIFS="$IFS"
    IFS=$'\ '
    local list=($(listLang))
    IFS="$OIFS"
    set +f
    cpt=1
    for id in ${list[@]}; do
        if [ ${cpt} -gt 1 ]; then
            displayLang ${id}
        fi
        ((cpt++))
    done
}

function displayLang() {
    id=${1}
    getLangById ${id}
}