#!/bin/bash

# Exactum-kamera saves one image every hour. The pictures are archived as files in subdirectories. This script counts picture files (.jpg extension) from subdirectories on current month using find, date and wc -l.

find /cs/home/tkt_cam/public_html/$(date +%Y/%m) -iname '*.jpg' | wc -l
