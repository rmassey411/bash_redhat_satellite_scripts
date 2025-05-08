#!/usr/bin/env bash

# Set cli args as variables
while getopts ":o:c:" arg; do
  case $arg in
    o) ORG=$OPTARG;;
    c) HC=$OPTARG;;
  esac
done


# Use hammer to cmd to invoke reboot job against host collection
hammer job-invocation create --job-template 'Update Package - Katello SSH Default' --search-query "host_collection = $HC"
