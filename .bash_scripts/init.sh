### _================
### __Load all scripts
### _================

### _(define fn)
load-all-scripts(){
    ### _(get current directory of this file)
    local SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

    ### _================
    ### __Load Order [comment out what you dont need]
    ### _================
    for __bs_file in $SCRIPT_DIR/bash/*; do source $__bs_file;done #_(0): all "bash" scripts
    for __bs_file in $SCRIPT_DIR/packages/*; do source $__bs_file;done #_(1): "package" scripts
    for __bs_file in $SCRIPT_DIR/linux/*; do source $__bs_file;done #_(2): "linux" scripts
    for __bs_file in $SCRIPT_DIR/arch/*; do source $__bs_file;done #_(3): "arch" scripts
}
### _(run fn)
load-all-scripts;
