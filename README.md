# cabot-docker
Containerized [Cabot](https://github.com/arachnys/cabot) for [Socialware](https://github.com/socialwareinc).
This container is loosely based on [shoonoise/cabot-docker](https://github.com/shoonoise/cabot-docker).

## Testing and Development
To quickly deploy cabot, simply use docker-compose:
```
git pull https://github.com/socialwareinc/cabot-docker.git
docker-compose up
```
This will create 5 containers with the appropriate links:

* Postgres
* SMTP
* Redis
* Cabot
* Nginx

Cabot is then accessible at http://$docker-machine-ip:8080. The default user is
admin/admin.

## Production Deployment
To deploy this container for production, all necessary environment variables
will need to be set. The container itself does not configure Cabot. The container
exposes port 5000 and can be linked to nginx or apache.
