# MSSQL Docker image

> This image use the same params pattern has others databases like `mysql` and `postgresql`

[![Docker Pulls](https://img.shields.io/docker/pulls/jaschweder/mssql.svg)](https://github.com/jaschweder/docker-image-mssql-server-linux)

## Environment

MSSQL_DATABASE
> set database name

MSSQL_USER
> user to be created on database boot

MSSQL_PASSWORD
> password for the `MSSQL_USER`

MSSQL_SA_PASSWORD
> password for the `sa` user

## How to use this image

##### Most simple use:
```sh
docker run \
    -e MSSQL_DATABASE=my_db \
    -e MSSQL_USER=my_user \
    -e MSSQL_PASSWORD=my_password \
    jaschweder/mssql
```

### Using with Docker Compose
```docker
version: '2'

services:
  web:
    ...
    environment:
      - DB_HOST=db
      - DB_NAME=my_database
      - DB_USER=my_user
      - DB_PASSWORD=my_password
  db:
    image: jaschweder/mssql
    environment:
      - MSSQL_DATABASE=my_database
      - MSSQL_USER=my_user
      - MSSQL_PASSWORD=my_password
```
## How to contribute

You are welcome, go to the repository on [Github](https://github.com/jaschweder/docker-image-mssql-server-linux)

## Bugs

Found a bug or some secure problem ? please, open an issue or send a e-mail to the author

## Author

Created and maintained by **Jonathan A. Schweder <jonathanschweder@gmail.com>**`
