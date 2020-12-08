#!/bin/bash
#

echo "This year have passed $(($(date +%j)/7)) weeks"

echo "This is $((365 - $(date +%j))) days before new year"
echo "This is $(((365 - $(date +%j))/7)) weeks before new year"
