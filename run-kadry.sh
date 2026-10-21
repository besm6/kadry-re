#!/bin/sh
set -eu
root=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
volumes=${KADRY_VOLUMES:-"$root/build/volumes"}
if [ ! -f "$volumes/2068" ] || [ ! -f "$volumes/2060" ]; then
    python3 "$root/tools/build-volumes.py" --output "$volumes"
fi
run_home="$root/build/home"
mkdir -p "$run_home"
{ printf 'арх кадры,40,100\nкадры\n'; cat; } |
    HOME="$run_home" "${DISPAK:-dispak}" --725 --path="$volumes:/usr/local/share/besm6" -q "$@" "$root/kadry.b6"
