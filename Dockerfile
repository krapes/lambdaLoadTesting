FROM ubuntu:18.04
MAINTAINER Kerri Rapes <kerri.rapes@gmail.com>

# install system-wide deps for python and node
RUN apt-get -yqq update
RUN apt-get -yqq install curl git nodejs npm python-pip python-dev curl gnupg

RUN curl -O https://storage.googleapis.com/golang/go1.11.2.linux-amd64.tar.gz
RUN tar -xvf go1.11.2.linux-amd64.tar.gz
RUN mv go /usr/local
ENV GOPATH="$HOME/work"
ENV PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"
RUN go version

RUN go get -u github.com/rakyll/hey

RUN npm install -g serverless
RUN serverless --version

RUN cd
COPY serviceFiles ./usercode
COPY dockerFiles ./usercode
WORKDIR usercode
RUN pip install -r requirements.txt


ENTRYPOINT ["bash", "start.sh", "AWS_ACCESS_KEY_ID", \
            "AWS_SECRET_ACCESS_KEY", "AWS_REGION", \
            "NUM_OF_REQUESTS", "NUM_OF_CONCURRENT"]

RUN echo "Done"