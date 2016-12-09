#!/bin/bash

# Exactum-kamera saves one image every hour. The pictures are archived as files in subdirectories. This script lists all files, but no directories from November 2011.

ls -R /cs/home/tkt_cam/public_html/2011/11/* | grep .jpg
