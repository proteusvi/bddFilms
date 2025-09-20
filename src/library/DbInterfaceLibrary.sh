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

#+------------------------------------+
#| Generic funtion to list content of |
#| table.                             |
#| Parameter :                        |
#|   table : name of table (string).  |
#| Return    :                        |
#|   std output list of table.        |
#+------------------------------------+
function listTable() {
    table="$1"
    mariadb -u${USER} -p${PASSWORD} -h${HOST} -P${PORT} ${NAME} -e \
    "SELECT * FROM ${table};" | cut -d\| -f1
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
    bodyFieldsRequest="$(requestHydratationFields ${fields[@]})"
    bodyValuesRequest="$(requestHydratationValues ${values[@]})"

    request="
    ${headerFieldsRequest}
    ${bodyFieldsRequest}
    ${headerValuesRequest}
    ${bodyValuesRequest}
    ${footerRequest}"

    echo ${request}
}

#+------------------------------------+
#| Liste content of table langue.     |
#| Return :                           |
#|   array : list of langs.           |
#+------------------------------------+
function listLang() {
    list=$(listTable bddFilms.langue)
    echo ${list[@]}
}
