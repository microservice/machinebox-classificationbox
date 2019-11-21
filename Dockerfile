FROM golang

RUN go get github.com/gorilla/mux

RUN go get -v github.com/machinebox/sdk-go/classificationbox

WORKDIR /go/src/github.com/oms-services/machinebox-classificationbox

ADD . /go/src/github.com/oms-services/machinebox-classificationbox

RUN go install github.com/oms-services/machinebox-classificationbox

ENTRYPOINT ["machinebox-classificationbox"]

EXPOSE 8000