# Grab-Site Docker Container
Simple containerized [grab-site](https://github.com/ArchiveTeam/grab-site).

 - Webinterface will be exposed to **port 29000**
 - Grab'ed sites will be saved in **/data**

## Basic Usage
Because our gs-server resides inside a docker container, grab-site must also be run inside the docker container. Rather than running `grab-site 'URL'`, you should run `docker exec grab-site-container grab-site 'URL'` so that `grab-site 'URL'` is ran inside the container.

### Start The Grab-Site Server
```
docker run -d --rm -p29000:29000 -v /path/to/data:/data --name grab-site nold360/grab-site
```

### Grab A Site
The following command will run grab-site against our test URL, inside the docker container, in detached mode (in the background).
```
docker exec -d grab-site-container grab-site --my-grab-site-options https://example.com
```

## Getting Started with Docker-Compose
### Example docker-compose.yml
```
version: '3'
services:
  grab-site:
    image: nold360/grab-site
    ports:
      - 29000:29000
    volumes:
      - ./data:/data
    restart: unless-stopped
```

### Starting the Grab-Site Server
```
docker-compose up -d --remove-orphans
```

### Grab A Site
```
docker-compose exec grab-site grab-site https://example.com
```
