#!/bin/bash
### _================
# ~/.bash_scripts/bash/04-colors.sh
### _================
export CLICOLOR=1
force_color_prompt=yes

### Basic
### _================
export WHITE=$(tput setaf 15)
export BLACK=$(tput setaf 0)
export RED=$(tput setaf 1)
export GREEN=$(tput setaf 2)
export YELLOW=$(tput setaf 220)
export BLUE=$(tput setaf 4)
export MAGENTA=$(tput setaf 5)
export CYAN=$(tput setaf 45)
export GRAY=$(tput setaf 8)
export ORANGE=$(tput setaf 202)
export PURPLE=$(tput setaf 57)
### Light
### _================
export LIGHT_GRAY=$(tput setaf 7)
export LIGHT_RED=$(tput setaf 9)
export LIGHT_GREEN=$(tput setaf 10)
export LIGHT_YELLOW=$(tput setaf 226)
export LIGHT_BLUE=$(tput setaf 12)
export LIGHT_MAGENTA=$(tput setaf 13)
export LIGHT_CYAN=$(tput setaf 51)
export LIGHT_ORANGE=$(tput setaf 208)
export LIGHT_PURPLE=$(tput setaf 63)
### Special
### _================
export RESET=$(tput sgr0)
export BOLD=$(tput bold)
export BLINK=$(tput blink)
export REVERSE=$(tput smso)
export UNDERLINE=$(tput smul)
export RING_BELL=$(tput bel)

### man-db
### _================
export LESS_TERMCAP_mb=$(tput blink) ### start blink
export LESS_TERMCAP_md=$(tput setaf 2; tput bold) ### start bold
export LESS_TERMCAP_me=$(tput sgr0)  ### reset
export LESS_TERMCAP_so=$(tput smso)  ### start standout
export LESS_TERMCAP_se=$(tput rmso)  ### stop standout
export LESS_TERMCAP_us=$(tput smul)  ### start underline
export LESS_TERMCAP_ue=$(tput rmul)  ### stop underline

### ls_colors
### _================
LS_DEFAULT_COLORS=(
    'no=00'
    'fi=00'
    'di=00;34'
    'ln=01;36'
    'pi=40;33'
    'so=01;35'
    'do=01;35'
    'bd=40;33;01'
    'cd=40;33;01'
    'or=40;31;01'
    'ex=01;32'
)
LS_EXTENSION_COLORS=(
    '*.tar=01;31'
    '*.tgz=01;31'
    '*.arj=01;31'
    '*.taz=01;31'
    '*.lzh=01;31'
    '*.zip=01;31'
    '*.z=01;31'
    '*.Z=01;31'
    '*.gz=01;31'
    '*.bz2=01;31'
    '*.deb=01;31'
    '*.rpm=01;31'
    '*.jar=01;31'
    '*.jpg=01;35'
    '*.jpeg=01;35'
    '*.gif=01;35'
    '*.bmp=01;35'
    '*.pbm=01;35'
    '*.pgm=01;35'
    '*.ppm=01;35'
    '*.tga=01;35'
    '*.xbm=01;35'
    '*.xpm=01;35'
    '*.tif=01;35'
    '*.tiff=01;35'
    '*.png=01;35'
    '*.mov=01;35'
    '*.mpg=01;35'
    '*.mpeg=01;35'
    '*.avi=01;35'
    '*.fli=01;35'
    '*.gl=01;35'
    '*.dl=01;35'
    '*.xcf=01;35'
    '*.xwd=01;35'
    '*.ogg=01;35'
    '*.mp3=01;35'
    '*.wav=01;35'
    '*.xml=00;31'
)
export LS_COLORS=$( printf '%s:' "${LS_DEFAULT_COLORS[@]}" && printf '%s:' "${LS_EXTENSION_COLORS[@]}" ) ### exports above ls options
