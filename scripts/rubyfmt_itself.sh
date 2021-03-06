#!/bin/bash
set -exuo pipefail

make
while IFS= read -r -d '' file
do
    time ruby --disable=gems build/rubyfmt.rb -i "$file"
done <   <(find src/*.rb -print0)
