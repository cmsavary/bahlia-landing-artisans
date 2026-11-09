FROM nginx:alpine
# Configuration nginx (type des sous-titres .vtt, durées de cache)
COPY docker/default.conf /etc/nginx/conf.d/default.conf
# Tout le contenu du dépôt est servi, sauf ce qui est listé dans .dockerignore
COPY . /usr/share/nginx/html
RUN rm -rf /usr/share/nginx/html/docker
EXPOSE 80
