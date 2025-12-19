FROM nginx:alpine

# Clean default nginx html
RUN rm -rf /usr/share/nginx/html/*

# Copy ALL files (html + assets)
COPY . /usr/share/nginx/html/
