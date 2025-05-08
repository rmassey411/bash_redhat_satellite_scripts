#!/usr/bin/env bash

# Set cli args as variables
while getopts ":c:t:u:" arg; do
  case $arg in
    c) HC=$OPTARG;;
    t) PT=$OPTARG;;
    u) EU=$OPTARG;;
  esac
done

# Use hammer to cmd to invoke reboot job against host collection
hammer job-invocation create --job-template "Satellite Worker :: Package Cleanup :: $PT" --effective-user $EU --search-query "host_collection = $HC"
