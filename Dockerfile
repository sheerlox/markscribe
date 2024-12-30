FROM golang:alpine as builder

LABEL authors="Christian Muehlhaeuser: muesli@gmail.com"

WORKDIR /go/markscribe2
COPY . .
RUN go build

FROM alpine

COPY --from=builder /go/markscribe2/markscribe2 /go/bin/markscribe2

ENTRYPOINT ["/go/bin/markscribe2"]
