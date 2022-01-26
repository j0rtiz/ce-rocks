FROM golang:1.17-alpine as build

WORKDIR /app

COPY . .

RUN go env -w GO111MODULE=off
RUN go build -o rocks .

FROM scratch

WORKDIR /app

COPY --from=build /app/rocks .

ENTRYPOINT ["/app/rocks"]
