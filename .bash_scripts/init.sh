#!/bin/bash
### _================
# ~/.bash_scripts/init.sh
### _================

load-all-scripts(){
    ### get current directory of `this` file
    local SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

    ### _================
    ### __Load Order [uncomment what you need]
    ### _================
    for __bs_file in $SCRIPT_DIR/bash/*; do source $__bs_file;done ### (0) bash-scripts
    # for __bs_file in $SCRIPT_DIR/packages/*; do source $__bs_file;done ### (1) package-scripts
    # for __bs_file in $SCRIPT_DIR/linux/*; do source $__bs_file;done ### (2) linux-scripts
    # for __bs_file in $SCRIPT_DIR/arch/*; do source $__bs_file;done ### (3) arch-scripts
    # for __bs_file in $SCRIPT_DIR/custom/*; do source $__bs_file;done ### (4) custom-scripts
}
load-all-scripts;
