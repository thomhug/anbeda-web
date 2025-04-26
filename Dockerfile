# Stage 1
FROM alpine:edge AS build

# Install the Hugo go app.
RUN apk add --no-cache hugo

WORKDIR /opt/HugoApp

# Copy Hugo config into the container Workdir.
COPY . .

# Run Hugo in the Workdir to generate HTML.
RUN hugo 

# Stage 2
FROM nginx:1.27-alpine
# FROM nginxinc/nginx-unprivileged:latest

# Set workdir to the NGINX default dir.
WORKDIR /usr/share/nginx/html

# Copy HTML from previous build into the Workdir.
COPY --from=build /opt/HugoApp/public .

# Expose port 8080
EXPOSE 8080/tcp
