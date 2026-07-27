#!/bin/sh
# Fetch the impact recordings, the one part of an object not mirrored in git.
# Names as arguments fetch those objects, no arguments fetches all.
# Existing files are kept, so the mirrored meshes keep their repairs.
set -e
cd "$(dirname "$0")"
if [ $# -gt 0 ]; then printf '%s\n' "$@"; else cat object_names.txt; fi | while read -r name; do
    if [ -f "$name/preprocessed/deconvolved_0db.npy" ]; then echo "$name (already hydrated)"; continue; fi
    echo "$name"
    wget "http://downloads.cs.stanford.edu/viscam/RealImpact/$name.zip"
    unzip -qn "$name.zip"
    rm "$name.zip"
done
