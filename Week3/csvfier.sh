#!/bin/bash

# This script rewrites consecutive spaces and all slashes as commas so your file looks like a CVS file.

sed -r 's_[ ]{2,}|\/_,_g' "$@"

