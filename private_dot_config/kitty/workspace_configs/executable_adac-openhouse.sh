#!/bin/bash

project_name="adac-openhouse"
project_dir=$1

kitty @ launch --title $project_name \
    --cwd $project_dir \
    --hold \
    bash -i -c "nvm use 18 && nvim"

kitty @ set-tab-title --match $(echo "title:"$project_name) $project_name
kitty @ launch --match $(echo "title:"$project_name) --type=window --location=hsplit --cwd=current bash -i -c "nvm use 12 && exec bash"

