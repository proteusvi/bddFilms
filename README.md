# bddFilms
Outil de recherche de film sur un serveur

## Developememt
- Linux machine native or virutal. Native recommmanded.
- docker and docker-compose installed.

### How to install project :
1. Clone the project git into your local workspace.
```bash
git clone https://github.com/proteusvi/bddFilms.git
```
2. Into the directory bddfilms, extract the [latest stable release](https://github.com/wodby/docker4php/releases) of [Docker4PHP](https://github.com/wodby/docker4php), and extract the package into the directory docker.
```bash
cd bddfilms
tar -xvf ~/downloads/docker4php.tar.gz
# The résult after extraction :
docker/
├── compose.yml
├── .env
├── Makefile
└── traefik.yml
```
- Into the file compose-yml comment all exept mysql container.
- From file .env replace project name with dbbfilms as PROJECT_NAME=bddfilms
- Add the port to mariadb into the file compose.yml as
```bash
  mariadb:
    image: wodby/mariadb:$MARIADB_TAG
    container_name: "${PROJECT_NAME}_mariadb"
    stop_grace_period: 30s
    environment:
      MYSQL_ROOT_PASSWORD: $DB_ROOT_PASSWORD
      MYSQL_DATABASE: $DB_NAME
      MYSQL_USER: $DB_USER
      MYSQL_PASSWORD: $DB_PASSWORD
    ports:
    - '13306:3306'
```

### Tools
- Editor : [Visual Code](https://code.visualstudio.com/download).
- Plugins :
 - [DBCode-Database Management](https://dbcode.io/).