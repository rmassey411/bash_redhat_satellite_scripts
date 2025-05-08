#!/usr/bin/env bash

# Set cli args as variables
while getopts ":c:f:o:" arg; do
  case $arg in
    c) HC=$OPTARG;;
    f) FILE=$OPTARG;;
    o) ORG=$OPTARG;;
  esac
done

# Loop thru hosts and add to host collection via hammer cmd
cat hosts.txt | while read host
do
       echo "Adding" $host "to" $HC
       hammer host-collection add-host --hosts $host --organization $ORG --name $HC
done
