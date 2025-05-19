FROM alpine:3.18

WORKDIR /app

# Copy the configuration file
COPY src/config.txt /app/config.txt

# Install basic utilities
RUN apk --no-cache add curl jq

# Display the content of the configuration file
CMD ["sh", "-c", "cat /app/config.txt && echo '\\nConfiguration loaded successfully!'"] 