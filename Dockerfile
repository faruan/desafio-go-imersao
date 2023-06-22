FROM golang:1.20 as build

WORKDIR /usr/src/app

COPY *.go ./
RUN go build main.go

FROM scratch

COPY --from=build /usr/src/app /usr/src/app

ENTRYPOINT [ "/usr/src/app/main" ]