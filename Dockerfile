FROM golang:1.18-alpine as builder

LABEL maintainer="Putu Krisna Andyartha"

RUN apk update && apk add --no-cache git

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o kkwatch

FROM golang:1.18-alpine
RUN apk --no-cache add ca-certificates

WORKDIR /root/

COPY --from=builder /app/kkwatch .
# COPY --from=builder /app/.env .  

EXPOSE 8080

CMD ["./kkwatch"]
