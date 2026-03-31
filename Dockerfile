# Use a light image with a web server
FROM nginx:alpine

# Copy your built web files to the server
COPY build/web /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start the server
CMD ["nginx", "-g", "daemon off;"]