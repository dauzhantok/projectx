FROM golang:1.24.5

# Set destination for COPY
WORKDIR /app

# Download Go modules
COPY go.mod go.sum ./
RUN go mod download

# Copy source files
COPY *.go ./

# Build
RUN CGO_ENABLED=0 GOOS=linux go build -o /projectx

# Document default port (update if your app uses another)
EXPOSE 8080

# Run the compiled binary
CMD ["/projectx"]