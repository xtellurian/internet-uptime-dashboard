FROM golang:alpine
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh gcc musl-dev sqlite
RUN mkdir /db
RUN /usr/bin/sqlite3 /db/uptime.db
RUN mkdir /app 
ADD . /app/
WORKDIR /app 
RUN go get github.com/mattn/go-sqlite3
RUN go build -o main .
CMD ["./main"]
