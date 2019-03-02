# Grab-Site Docker Container
Simple Docker-Container for [grab-site](https://github.com/ArchiveTeam/grab-site)

 - Webinterface will be exposed to **port 29000**
 - Grab'ed sites will be saved in **/data**

## Basic Usage
### Start The Grab-Site Server
```
docker run -d --rm -p29000:29000 -v /path/to/data:/data --name grab-site-container nold360/grab-site
```

### Grab A Site
```
docker exec grab-site-container grab-site --my-grab-site-options https://example.com
```

## Using Docker-Compose
### Sample docker-compose.yml
```
version: '3'
services:
  grabsite:
    image: nold360/grab-site
    ports:
      - 29000:29000
    volumes:
      - ./data:/data
    restart: unless-stopped
```

### Start Server
```
docker-compose up -d
```

### Grab A Site
```
docker-compose exec grabsite grab-site --my-grab-site-options https://example.com
```
