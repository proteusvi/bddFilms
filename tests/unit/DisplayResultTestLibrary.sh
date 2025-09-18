#!/bin/bash
#    .--.
#   |o_o |
#   |:_/ |
#  //   \ \
# (|     | )
# /'\_   _/`\
# \___)=(___/
# File library to display test result.
# @auth  : proteusvi@gmail.com
# @since : mer. 17 sept. 2025 08:59:28 CEST

#+---------------------------------------+
#| Display failed message in red.        |
#+---------------------------------------+
function displayFailed() {
    echo -e "\e[31mFailed\e[0m"
}

#+---------------------------------------+
#| Display succeed message in green.     |
#+---------------------------------------+
function displaySucceed() {
    echo -e "\e[32mSucceed\e[0m"
}

#+---------------------------------------+
#| Display result of test.               |
#| If test succed, is displayed in green.|
#| Else failed is displayed in red and   |
#| the difference is showed.             |
#+---------------------------------------+
function displayResultTest() {
    testName="$1"
    expected="$2"
    effective="$3"

    echo -en "\e[34m${testName} :\e[0m\n"
    if [[ "${expected}" == "${effective}" ]]; then
        displaySucceed
    else
        displayFailed
        echo -en "The result :\n"
        echo -en "\e[31m${effective}\e[0m\n"
        echo -en "doesn't correspond to expected :\n"
        echo -e "\e[34m${expected}\e[0m"
    fi
}
