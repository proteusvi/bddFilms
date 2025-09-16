#!/bin/bash
# Library to be used in external scripts.
# @auth  : proteusvi@gmail.com
# @since : mar. 16 sept. 2025 14:40:49 CEST

#+------------------------------------+
#| Display title passed by parameter. |
#| Parameter : $title (string).       |
#| Return    : Title formated.        |
#+------------------------------------+
function displayTitle() {
    title="${1}"
    echo -en "+---------------------------------+\n"
    echo -en "# ${title}$(createSpacesForTitle "${title}")#\n"
    echo -en "+---------------------------------+\n"
}


#+------------------------------------+
#| Display spaces needed after text   |
#|   passed by parameter.             |
#| Parameter : $text (string)         |
#| Return    : Spaces needed.         |
#+------------------------------------+
function createSpacesForTitle() {
    maxSpaces=$((33))
    text="$1"
    length=${#text}
    spaces='                                '
    if [[ "${length}" > "0" ]]; then
       i=$((${maxSpaces}-${length}-1))
       spaces=''
       while [ $i != 0 ]; do
          spaces=${spaces}' '
          ((i--)) 
       done
    fi
    echo -en "${spaces}";
}

