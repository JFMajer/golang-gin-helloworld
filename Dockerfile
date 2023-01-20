# Build Stage

FROM golang:1.19-alpine AS ChonkyBuilder

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -o ./hello-world-gin

# Deploy Stage

FROM alpine:latest


COPY --from=ChonkyBuilder /app/hello-world-gin .

CMD ["./hello-world-gin"] 