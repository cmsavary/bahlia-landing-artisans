FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
COPY fonts /usr/share/nginx/html/fonts
COPY photos /usr/share/nginx/html/photos
COPY videos /usr/share/nginx/html/videos
EXPOSE 80
