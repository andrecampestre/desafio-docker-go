FROM golang:alpine as builder

WORKDIR /go/src/app

COPY go.mod .

RUN go mod download

COPY main.go .

RUN go build -o app

FROM scratch

COPY --from=builder /go/src/app/app /

CMD ["/app"]
