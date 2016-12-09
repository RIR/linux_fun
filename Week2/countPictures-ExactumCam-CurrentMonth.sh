#!/bin/bash

# Exactum-kamera saves one image every hour. The pictures are archived as files in subdirectories. This script counts picture files (.jpg extension) from subdirectories on current month.

ls -R /cs/home/tkt_cam/public_html/$(date +%Y/%m) | grep .jpg | wc -l
