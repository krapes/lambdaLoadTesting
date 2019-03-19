#!/usr/bin/env bash

echo "----- Starting Test -----"

sls deploy | tee deploy.out

declare -a endpoints=$(python endpointsParser.py deploy.out)

for endpoint in "${endpoints[@]}"; do
     echo "----- Testing Endpoint $endpoint -----"
     /../work/bin/hey -n 5000 -c 50 "$endpoint"
done

sls remove
