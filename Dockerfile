FROM golang:1.20-alpine3.18 as builder

# LABEL maintainer="Putu Krisna Andyartha"
RUN echo $GOPATH

RUN apk add --no-cache git gcc musl-dev
RUN apk add --update make
WORKDIR /go/src/github.com/ayu-devtron/golang-api

ADD . /go/src/github.com/ayu-devtron/golang-api

RUN ls -l

RUN CGO_ENABLED=0 GOOS=linux go build -o golang-api

RUN ls -l

FROM golang:1.18-alpine
RUN apk --no-cache add ca-certificates

RUN adduser -D devtron

COPY --from=builder /go/src/github.com/ayu-devtron/golang-api .
# COPY --from=builder /app/.env .  
RUN chown devtron:devtron ./golang-api

RUN chmod +x ./golang-api

USER devtron

EXPOSE 8080

CMD ["./golang-api"]
