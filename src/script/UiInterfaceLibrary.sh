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
# @since : mar. 16 sept. 2025 14:40:49 CEST

#+------------------------------------+
#| Display title passed by parameter. |
#| Parameter : $title (string).       |
#| Return    : Title formated.        |
#+------------------------------------+
function displayTitle() {
    title="${1}"
    spaces=$(createSpacesForTitle "${title}")
    case ${spaces} in
        *Error*)
            echo "${spaces}"
            ;;
        *)
            lineTitle="# ${title}${spaces}#\n"
            echo -en "+---------------------------------+\n"
            echo -en "${lineTitle}"
            echo -en "+---------------------------------+\n"
    esac
}


#+------------------------------------+
#| Display spaces needed after text   |
#|   passed by parameter.             |
#| Parameter : $text (string)         |
#| Return    : Spaces needed.         |
#| If more than 32 characters         |
#| a message is generated and         |
#| displayed.                         |
#+------------------------------------+
function createSpacesForTitle() {
    maxSpaces=$((33))
    text="$1"
    length=${#text}
    spaces='                                '
    if [[ "${length}" > "0" ]] &&
       [[ "${length}" < "32" ]]; then
       i=$((${maxSpaces}-${length}-1))
       spaces=''
       while [ $i != 0 ]; do
          spaces=${spaces}' '
          ((i--)) 
       done
    elif [[ "${length}" > "33" ]]; then
       ((error++))
       message="\e[31mError :\e[0m\n"
       message="${message}Title is equal or greater than 32 characters."
       echo -en "${message}"
       return
    fi
    echo -en "${spaces}";
}
