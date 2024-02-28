#!/bin/bash

function git_repository_name(){
        IFS='/'
        read -a gitnamearr <<< "$git_repository_url"
        arrlen=${#gitnamearr[@]}
        IFS="."
        read -a repoarr <<< "${gitnamearr[arrlen-1]}"
        echo ${repoarr[0]}
}

git_repository_url=$1
git_repository_name
start=$2
stop=$3
num_samples=$4
pop_size=$5

cd $(git_repository_name)
cd scripts/run_model
python epispot.py --start ${start} --stop ${stop} --num_samples ${num_samples} --pop_size ${pop_size}

