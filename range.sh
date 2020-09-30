#!/usr/bin/env bash

# Given the ID of a Vital card reader, this function returns the path to the process used to access it.
#   If    1  <= id <= 63   then we use /usr/local/galss/galsvlux
#   If   64  <= id <= 126  then we use /usr/local/gals1/galsvlux
#   if   127 <= id <= 189  then we use /usr/local/gals2/galsvlux
# @param $1 The ID of the Vital card reader.
# @return Upon successful completion the function returns a string of characters that represents the path
#         to the process used to access the reader. Otherwise the function returns an empty string.

function get_galsvlux {
    local reader_id=$1
    local process=""

    if [[ ${reader_id} -ge 1 && ${reader_id} -le 63 ]]; then
        process="/usr/local/galss/galsvlux"
    fi

    if [[ ${reader_id} -ge 64 && ${reader_id} -le 126 ]]; then
        process="/usr/local/gals1/galsvlux"
    fi

    if [[ ${reader_id} -ge 127 && ${reader_id} -le 189 ]]; then
        process="/usr/local/gals2/galsvlux"
    fi

    echo "${process}"
}

# Test get_galsvlux

function test_get_galsvlux {
    local id=$1
    local p=$(get_galsvlux ${id})
    echo "${id} -> ${p}"
}

echo "Should return /usr/local/galss/galsvlux"
test_get_galsvlux 1
test_get_galsvlux 2
test_get_galsvlux 62
test_get_galsvlux 63
echo "Should return /usr/local/gals1/galsvlux"
test_get_galsvlux 64
test_get_galsvlux 65
test_get_galsvlux 125
test_get_galsvlux 126
echo "Should return /usr/local/gals2/galsvlux"
test_get_galsvlux 127
test_get_galsvlux 128
test_get_galsvlux 188
test_get_galsvlux 189
echo "Should return an empty string"
test_get_galsvlux 190
