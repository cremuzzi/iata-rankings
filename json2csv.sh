#!/usr/bin/env sh

# this script helps you convert the retrieved json data to csv

SOURCE_DIR=${PWD}/data
TARGET_DIR=${PWD}/csv

mkdir -p $TARGET_DIR 

convert() {
    output_file="${1}.csv"
    echo "converting ${1} to ${output_file}"
    echo "id,name,code,region_id,latitude,longitude,rank,score" > ${output_file}
    jq -r '. | map([.passport.id, .passport.name, .passport.code, .passport.region_id, .passport.latitude, .passport.longitude, .passport.rank, .passport.score ] | join(", ")) | join("\n")' ${1} >> ${output_file}
    #sleep 2
}

for i in $SOURCE_DIR/*.json
do
    convert $i
done
