# Stage 1
FROM alpine:edge AS build

# Install the Hugo go app.
RUN apk add --no-cache hugo

WORKDIR /opt/HugoApp

# Copy Hugo config into the container Workdir.
COPY . .

# Build argument for baseURL (can be overridden at build time)
ARG HUGO_BASEURL="https://www.anbeda.ch"

# Run Hugo in the Workdir to generate HTML.
RUN hugo --gc --baseURL="${HUGO_BASEURL}"

# Stage 2
FROM nginx:1.27-alpine
# FROM nginxinc/nginx-unprivileged:latest

# Set workdir to the NGINX default dir.
WORKDIR /usr/share/nginx/html

# Copy HTML from previous build into the Workdir.
COPY --from=build /opt/HugoApp/public .

# Copy custom nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80/tcp
