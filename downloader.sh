#!/usr/bin/env sh

# this script helps you download the full data set from the original source

TARGET_DIR=${PWD}/data

mkdir -p $TARGET_DIR 

get_rankings() {
    echo "retrieving henley passport ranking for year ... ${1}"
    curl -fsL -X GET https://www.henleypassportindex.com/fetch\?url\=rankings%2F${1} -o $TARGET_DIR/hpr.${1}.json  
    sleep 2
}

# rankings are only available from the year 2006

for i in {2006..2020} 
do
    get_rankings $i 
done
