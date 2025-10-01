#!/bin/bash
#    .--.
#   |o_o |
#   |:_/ |
#  //   \ \
# (|     | )
# /'\_   _/`\
# \___)=(___/
# Library to be used in external scripts.
# @auth  : proteusvi@gmail.com
# @since : jeu. 18 sept. 2025 10:24:42 CEST

USER="${DB_USER}";
PASSWORD="${DB_PASSWORD}"
HOST="localhost"
NAME="${DB_NAME}"
PORT="13306"


getListIdsFromTable()  {
    table="$1"
    set -f
    OIFS="$IFS"
    IFS=$'\n'
    results=( $(mariadb -u${USER} -p${PASSWORD} -h${HOST} -P${PORT} ${NAME} -Be \
    "SELECT id FROM ${table};") )
    IFS="$OIFS"
    set +f
    echo "${results[@]}"
}

#+-------------------------------------+
#| Generic funtion to get the last id  |
#| from a table.                       |
#| Parameter :                         |
#|   table : name of table (string).   |
#| Return    :                         |
#|   std output : last id (int).       |
#+-------------------------------------+
function getLastIdFromTable() {
    table="$1"
    result="$(mariadb -u${USER} -p${PASSWORD} -h${HOST} -P${PORT} ${NAME} -e \
    "SELECT max(id) FROM ${table};" | cut -d\| -f1 | grep -v id)"
    echo "${result}"
}

#+-------------------------------------+
#| Generic funtion to create a string  |
#| of fields for an insert request.    |
#| Parameter :                         |
#|   fields : list of fields (array).  |
#| Return    :                         |
#|   std output : string of fields.    |
#+-------------------------------------+
function requestHydratationFields() {
    fields=("${@}")
    bodyfields=""
    length=${#fields[@]}

    cpt=1
    for field in "${fields[@]}"; do  
       bodyfields="${bodyfields}${field}"
       if (( ${cpt} < ${length} )); then
          bodyfields="${bodyfields}, "
       fi
       ((cpt++))
    done
    echo ${bodyfields}
}

#+-------------------------------------+
#| Generic funtion to create a string  |
#| of values for an insert request.    |
#| Parameter :                         |
#|   values : list of values (array).  |
#| Return    :                         |
#|   std output : string of values.    |
#+-------------------------------------+
function requestHydratationValues() {
    values=("${@}")
    bodyValues=""
    length=${#values[@]}

    cpt=1
    for value in "${values[@]}"; do  
       bodyValues="${bodyValues}\"${value}\""
       if (( ${cpt} < ${length} )); then
          bodyValues="${bodyValues}, "
       fi
       ((cpt++))
    done
    echo "${bodyValues}"
}

#+--------------------------------------------+
#| Build an insert into request.              |
#| Parameter :                                |
#|   table         : name of table (string).  |
#|   numberOfField : number of fields (int).  |
#|   fields        : list of fields (array).  |
#|   values        : list of values (array).  |
#| Return    :                                |
#|   std output : request (string).           |
#+--------------------------------------------+
function buildInsertIntoRequest() {
    table="$1"
    numberOfField="$2"
    shift 2
    fields=("${@:1:${numberOfField}}")
    shift $((numberOfField))
    values=("${@}")
    
    headerFieldsRequest="INSERT INTO ${table} ("
    headerValuesRequest=") VALUES ("
    footerRequest=");"
    bodyFieldsRequest="$(requestHydratationFields "${fields[@]}")"
    bodyValuesRequest="$(requestHydratationValues "${values[@]}")"

    request="
    ${headerFieldsRequest}
    ${bodyFieldsRequest}
    ${headerValuesRequest}
    ${bodyValuesRequest}
    ${footerRequest}"

    echo ${request}
}

function addValuesToTable() {
    table="$1"
    numberOfField="$2"
    shift 2
    fields=("${@:1:${numberOfField}}")
    shift $((numberOfField))
    values=("${@}")
    
    request=$(buildInsertIntoRequest ${table} ${numberOfField} "${fields[@]}" "${values[@]}")
    mariadb -u${USER} -p${PASSWORD} -h${HOST} -P${PORT} ${NAME} -e "${request}"
}
