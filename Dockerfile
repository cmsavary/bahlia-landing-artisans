FROM nginx:alpine
# Tout le contenu du dépôt est servi, sauf ce qui est listé dans .dockerignore
COPY . /usr/share/nginx/html
EXPOSE 80
