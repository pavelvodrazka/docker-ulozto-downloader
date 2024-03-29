# docker-ulozto-downloader

![Docker Pulls](https://img.shields.io/docker/pulls/pjslf/ulozto-downloader?label=PULLS&logo=docker&logoColor=white&style=for-the-badge)
![Docker Stars](https://img.shields.io/docker/stars/pjslf/ulozto-downloader?label=STARS&logo=docker&logoColor=white&style=for-the-badge)
![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/pjslf/ulozto-downloader/latest?logo=docker&logoColor=white&style=for-the-badge)
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/pjslf/ulozto-downloader/latest?logo=docker&logoColor=white&style=for-the-badge)
![GitHub Repo stars](https://img.shields.io/github/stars/pavelvodrazka/docker-ulozto-downloader?logo=github&style=for-the-badge)
![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/pavelvodrazka/docker-ulozto-downloader/docker-publish.yml?logo=github&style=for-the-badge)

Debian based image of  [ulozto-downloader](https://github.com/setnicka/ulozto-downloader) containing TensorFlow Lite to support automatic CAPTCHA solving.

## Usage 

### docker cli

```
docker run --tty --rm \
  --name ulozto-downloader \
  --volume ~/downloads:/downloads \
  pjslf/ulozto-downloader [OPTIONS] $URL
```

### shell script

```bash
#!/bin/bash

USER=$(id -u)
GROUP=$(id -g)
DOWNLOADS=~/downloads

docker run --tty --rm \
    --name ulozto-downloader \
    --user $USER:$GROUP \
    --volume $DOWNLOADS:/downloads \
    pjslf/ulozto-downloader "$@"
```

## Volumes

`/downloads` - Volume where to put downloaded files.

## Downloader Options

```
Positional arguments:
  URL                   URL from Uloz.to (tip: enter in 'quotes' because the URL contains ! sign). Multiple URLs could be specified, they will be downloaded sequentially.

Main options:
  --parts N             Number of parts that will be downloaded in parallel (default: 20)
  --password P          Optional password if the file is password-protected (default: )
  --output DIRECTORY    Directory or full path including file name where output file will be saved (default: ./)
  --temp DIRECTORY      Directory where temporary files (.ucache, .udown, Tor data directory) will be created (default: ./)
  -y, --yes             Overwrite files without asking (default: False)

Display and logging options:
  --parts-progress      Show progress of parts while being downloaded (default: False)
  --log LOGFILE         Enable logging to given file (default: )
  --frontend {console,JSON}
                        Select frontend: 'console' - text user interface for humans, 'JSON' - output for scripts (default: console)

CAPTCHA solving related options:
  --conn-timeout SEC    Set connection timeout for TOR sessions in seconds (default: 30)

Other options:
  --version             Show program's version number and exit
  -h, --help            Show this help message and exit
```

## Credits

[Jiří Setnička](https://github.com/setnicka) - Author of the [ulozto-downloader](https://github.com/setnicka/ulozto-downloader) used by this image.
