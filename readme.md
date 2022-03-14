# Simple REST API Go App

## Features:
- Gin for the web framework
- Gorm for ORM
- jwt-go for authentication
- Docker with MySQL and phpmyadmin
- Portainer for container managements

## How to use:
- Clone the repo
- `sudo docker-compose -p local-prep --file docker-compose.yml up -d`
- Run build.sh
- `go run server.go`

## Misc info:
### phpMyAdmin
- access via `http://localhost:8085/` or through the "Open in Browser" in Docker Desktop
- by default: server is `db`, username is `root`, and password is `test`. configurable within `docker-compose.yml`
### Portainer
- access via `http://localhost:9000/`
- feel free to set the password and username when running it for the first time
### Testing
- open your browser and go to `http://localhost:8080/`, if all is fine you would be greeted by `Hello, World`
- use Postman or similar tools and set the url to `http://localhost:8080/`
- do not forget to set the `Authorization` key within `Headers` on your requests on some routes protected by the jwt middleware
- available routes: 
  - POST    /api/auth/login
  - POST    /api/auth/register
  - GET     /api/users/profile
  - PUT     /api/users/
  - GET     /api/books/       
  - POST    /api/books/       
  - GET     /api/books/:id    
  - PUT     /api/books/:id    
  - DELETE  /api/books/:id    
  - GET     /        