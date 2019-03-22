#!/usr/bin/env bash


# Define AWS Creds
if [[ -z "${aws_access_key_id}" ]]; then

  AWS_ACCESS_KEY_ID=$(aws --profile honestAbe configure get aws_access_key_id)
else
  echo "AWS access key found"
  AWS_ACCESS_KEY_ID="${aws_access_key_id}"
fi



if [[ -z "${aws_secret_access_key}" ]]; then
  AWS_SECRET_ACCESS_KEY=$(aws --profile honestAbe configure get aws_secret_access_key)
else
  echo "aws secret access key found"
  AWS_SECRET_ACCESS_KEY="${aws_secret_access_key}"
fi


AWS_REGION=us-east-1



while getopts n:c: option
do
case "${option}"
in
n) NUM_OF_REQUESTS=${OPTARG};;
c) NUM_OF_CONCURRENT=${OPTARG};;
esac
done


echo $NUM_OF_REQUESTS
echo $NUM_OF_CONCURRENT


docker build -t concurrency:latest  .

docker run -it --rm \
   -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
   -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
   -e AWS_REGION=$AWS_REGION  \
   -e NUM_OF_REQUESTS=$NUM_OF_REQUESTS \
   -e NUM_OF_CONCURRENT=$NUM_OF_CONCURRENT \
   concurrency:latest