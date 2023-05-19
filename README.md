
<h1 align="center">bash_scripts</h1>

<div align="center">
  
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
  
#### A collection of `bash` scripts to make ~~bash~~ *life* easier.

</div>

## Goal:
I wanted a place for myself or anyone else to go to remember useful one-liners, learn something new, or find examples of bash scripts.

## Features:
- Many useful [one-liners](https://github.com/rrrossettiii/bash_scripts/blob/trunk/.bash_scripts/bash/08-aliases.sh) and bash [utilities](https://github.com/rrrossettiii/bash_scripts/blob/trunk/.bash_scripts/bash/16-fn_utils.sh).
- Easily add your own scripts by adding a `<script-name>.sh` file to `.bash_scripts/custom`
- Sophisticated [history control](https://github.com/rrrossettiii/bash_scripts/blob/trunk/.bash_scripts/bash/00-history_control.sh).
- [Colors!](https://github.com/rrrossettiii/bash_scripts/blob/trunk/.bash_scripts/bash/04-colors.sh)

## Setup:
1. Download this repo.
    ```
    git clone https://github.com/rrrossettiii/bash_scripts
    ```
2. Copy `.bash_scripts` to your home directory.
    ```
    cp bash_scripts/.bash_scripts ~
    ```
3. Copy `.bash_env` to your home directory.
    ```
    cp bash_scripts/.bash_env ~
    ```
4. Copy `.bashrc` to your home directory.
    ```
    cp bash_scripts/.bashrc ~
    ```
    **or** paste this at the end of your current `.bashrc`.
    ```
    source ~/.bash_env #_(loads .bash_env variables)
    source ~/.bash_scripts/init.sh #_(loads all bash_scripts)
    ```
5. Reload your `.bashrc`.
    ```
    source ~/.bashrc
    ```
6. Profit ???
