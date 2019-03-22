#!/usr/bin/env bash


while getopts n:c:p: option
do
case "${option}"
in
n) num_of_request=${OPTARG};;
c) num_of_concurrent=${OPTARG};;
p) aws_profile=${OPTARG};;
esac
done

AWS_PROFILE=${aws_profile:-default}

# Define AWS Creds
if [[ -z "${aws_access_key_id}" ]]; then

  AWS_ACCESS_KEY_ID=$(aws --profile $AWS_PROFILE configure get aws_access_key_id)
else
  echo "AWS access key found"
  AWS_ACCESS_KEY_ID="${aws_access_key_id}"
fi



if [[ -z "${aws_secret_access_key}" ]]; then
  AWS_SECRET_ACCESS_KEY=$(aws --profile $AWS_PROFILE configure get aws_secret_access_key)
else
  echo "aws secret access key found"
  AWS_SECRET_ACCESS_KEY="${aws_secret_access_key}"
fi


AWS_REGION=us-east-1


num_of_request=${num_of_request:-1000}
num_of_concurrent=${num_of_concurrent:-50}

NUM_OF_REQUESTS=${NUM_OF_REQUESTS:-num_of_request}
NUM_OF_CONCURRENT=${NUM_OF_CONCURRENT:-num_of_concurrent}



docker build -t concurrency:latest  .

docker run -it --rm \
   -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
   -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
   -e AWS_REGION=$AWS_REGION  \
   -e NUM_OF_REQUESTS=$NUM_OF_REQUESTS \
   -e NUM_OF_CONCURRENT=$NUM_OF_CONCURRENT \
   concurrency:latest