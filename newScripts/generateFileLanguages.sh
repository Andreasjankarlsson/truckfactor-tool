#!/bin/bash

path=$1

# Capture the result of the Ruby script
ruby fileTypes.rb $path>$path/fileLanguages.log

echo "Created fileLanguages.log"