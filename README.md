[![Build Status](https://travis-ci.org/krapes/lambdaLoadTesting.svg?branch=master)](https://travis-ci.org/krapes/lambdaLoadTesting)
# Lambda Load Testing
This small program designed simplify load testing of a AWS Service. The project was inspired by the blog [Managing AWS Lambda Function Concurrency](https://aws.amazon.com/blogs/compute/managing-aws-lambda-function-concurrency/) and is powered by the [HEY!](https://github.com/rakyll/hey) project. 

### Pre-ReqS
Before we can begin testing your service there are a couple things that you need to have installed in your local enviorment.
1) The project compartmentalizes everything you need to deploy, test, and clean-up inside a docker container. Before begining make sure you have docker [installed](https://docs.docker.com/v17.12/install/) and can successfully run the [Hello-World](https://docs.docker.com/v17.12/get-started/part2/) container.

2) When you first run the code it will execute a BASH script that extracts your _AWS Access Key_ and _AWS Secret Access Key_ from your enviorment variables. Don't panic yet :) There's no security threat because the container that uses those keys only exists on your local computer and will never be pushed to an external enviorment. That being said, you do need to have your credentials setup properly for everything to work. If you have not done so yet, install the [AWS Command Line Interface](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html) and enter your [AWS configuration](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html).
````
$ pip3 install awscli --upgrade
$ aws configure
````

### Setup
Now we can bring the project to your local computer and prepare it for the tests. 
1) Clone the git repository.
```
$ git clone https://github.com/krapes/lambdaLoadTesting.git
````
2) Modify the _serviceFiles_ directory with your service files.
    * Navigate to the _serviceFiles_ directory. Currently it contains a _dummy_ lambda and the serverless.yml

    * If you would like to test the load preformance of one lambda simply replace the code inside dummy.py with your function. _(Make sure the file is still named dummy.py and that your lambda starts from main(event, context)    )_

    * If you have multiple files you can replace the whole folder with your service. The program will deploy your service, test all of the created endpoints, and then remove the service. It's recommand that you change to name of the service inside your _serverless.yml_ file so as to not affect your normal service. 

### Run
Now your project is ready to run.
1) Navigate to the top folder _lambdaLoadTesting_
2) In the command line execute:
````
$ run.sh
`````
3) Wait for your results to appear in the terminal




