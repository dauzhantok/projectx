FROM golang:1.24.5
 
WORKDIR /app
 
COPY go.mod ./
RUN go mod download
 
COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -o /projectx 
EXPOSE 8080 
CMD ["/projectx"]