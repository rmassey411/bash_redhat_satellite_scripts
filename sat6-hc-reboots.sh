#!/usr/bin/env bash

# Set cli args as variables
while getopts ":c:u:" arg; do
  case $arg in
    c) HC=$OPTARG;;
    u) EU=$OPTARG;;
  esac
done

# Use hammer to cmd to invoke reboot job against host collection
hammer job-invocation create --job-template 'Satellite Worker :: Reboot Systems' --inputs action=restart --effective-user $EU --search-query "host_collection = $HC"
