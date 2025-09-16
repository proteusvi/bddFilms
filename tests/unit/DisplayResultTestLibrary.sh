#!/bin/bash

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

    echo -en "Test ${testName} : "
    if [[ "${expected}" == "${effective}" ]]; then
        echo -e "\e[32mSucceed\e[0m"
    else
        echo -e "\e[31mFailed\e[0m"
        echo -en "The result :\n"
        echo -en "\e[31m${effective}\e[0m\n"
        echo -en "doesn't correspond to expected :\n"
        echo -e "\e[34m${expected}\e[0m"
    fi
}