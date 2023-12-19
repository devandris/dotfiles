#!/bin/bash

path_to_project_file=$(fdfind -a --base-directory $HOME/Documents/projects --type=f pom.xml\|package.json --exclude node_modules --max-depth 4 | rofi -dmenu -p "Project: ")
project_dir=$(dirname $path_to_project_file)
project_name=$(basename $project_dir)

source $KITTY_WORKSPACE/$project_name.sh $project_dir

# JAVA_HOME=/home/devandris/.jabba/jdk/openjdk@1.17.0
# PATH=$PATH:$JAVA_HOME/bin
#
# kitty @ launch --title $project_name \
#     --type os-window \
#     --env JAVA_HOME=$JAVA_HOME \
#     --env PATH=$PATH \
#     --cwd $project_dir \
#     nvim
#
# kitty @ launch --type window --window-title bash --copy-env --location=hsplit --dont-take-focus --cwd current


