#!/bin/bash
script_dir=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")
export Red="\033[0;31m"
export Blue="\033[1;34m"
export Yellow="\033[1;33m"
export Nc="\033[0m"
export config_root_dir="$PWD"
