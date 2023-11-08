#!/bin/bash
let i=0
while :; do
    let i++
    echo 'Scanning...'
    scanimage -o image_$i.png --mode color --resolution 100 --progress
    read -p 'Press enter to scan again. CTRL + C to finish'
done
