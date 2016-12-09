#!/bin/bash

# This script takes two command line arguments as its parameters: a hostname and a command. The script will execute command at hostname, and print out the output returned by the host.

ssh $1 $2
