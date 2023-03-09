FROM golang:latest AS builder

RUN mkdir /build
WORKDIR /build
COPY . .
ENV CGO_ENABLED=0
RUN go build -o otel-cli .

FROM busybox:1.35 AS otel-cli

COPY entrypoint.sh /entrypoint.sh
COPY --from=builder /build/otel-cli /otel-cli

ENTRYPOINT ["/entrypoint.sh"]
