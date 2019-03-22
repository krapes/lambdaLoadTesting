#!/usr/bin/env bash

echo "----- Starting Test -----"

sls deploy | tee deploy.out

declare -a endpoints=$(python endpointsParser.py deploy.out)


for endpoint in "${endpoints[@]}"; do
     echo "----- Testing Endpoint $endpoint -----"
     /../work/bin/hey -n $NUM_OF_REQUESTS -c $NUM_OF_CONCURRENT "$endpoint"
done

sls remove
