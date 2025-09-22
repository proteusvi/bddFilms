
#!/bin/bash
#    .--.
#   |o_o |
#   |:_/ |
#  //   \ \
# (|     | )
# /'\_   _/`\
# \___)=(___/
# Script representing a language.
# @auth  : proteusvi@gmail.com
# @since : lun 22 sep 2025 13:22:16 CEST

id=
libelle=
abr=

getLibelle() {
    echo ${libelle}
}

getAbr() {
    echo ${abr}
}

setLanguage() {
    id=${1}
    libelle=${2}
    abr=${3}
}

getLanguage() {
    language[0]=${id}
    language[1]=${libelle}
    language[2]=${abr}
    echo ${language[@]}
}