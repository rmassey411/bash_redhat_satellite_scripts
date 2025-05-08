#!/usr/bin/env bash

# Set cli args as variables
while getopts ":c:t:u:" arg; do
  case $arg in
    c) HC=$OPTARG;;
    u) EU=$OPTARG;;
  esac
done

# Use hammer to cmd to invoke package cleanup job against host collection
hammer job-invocation create --job-template 'Satellite Worker :: Package Cleanup :: Kernel' --inputs "command=sudo package-cleanup --oldkernels --count 1 -y" --effective-user $EU --search-query "host_collection =  $HC"
