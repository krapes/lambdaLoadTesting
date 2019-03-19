#!/usr/bin/env bash

AWS_ACCESS_KEY_ID=$(aws --profile honestAbe configure get aws_access_key_id)
AWS_SECRET_ACCESS_KEY=$(aws --profile honestAbe configure get aws_secret_access_key)
AWS_REGION=us-east-1



docker build -t concurrency:latest  .

docker run -it --rm \
   -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
   -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
   -e AWS_REGION=$AWS_REGION concurrency:latest