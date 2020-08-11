# API ON RAILS

### Instalacion
Dentro de la carpeta raiz `api-on-rails/`:
Modificar dentro del archivo `docker-compose.yml` la variable de entorno `DEVISE_JWT_SECRET_KEY`, generada con el algoritmo HS256
Se puede generar con `bundle exec rake secret` o dentro del contenedor, si ya esta arribia `$ docker-compose exec app bundle exec rake secret`

Luego ejecutar:
```bash
$ docker-compose up -d
$ docker-compose exec app bundle exec rake db:setup db:migrate db:migrate db:seed
```

### Ejecutar los tests:
```sh
$ docker-compose exec -e RAILS_ENV=test app bundle exec rails db:test:purge db:migrate RAILS_ENV=test
$ docker-compose exec -e RAILS_ENV=test app bundle exec rspec
```

### API
POST /api/v1/login
| VALOR | DESCRIPCION |
| ------ | ------ |
| username | Nombre de usuario a loguear |
| password | Contrasena del usuario a loguear |

GET /api/v1/user/:id

PUT /api/v1/user/:id
| VALOR | DESCRIPCION |
| ------ | ------ |
| user[username] | Nombre de usuario del usuario |
| user[email] | Correo del usuario  |
| user[password] | Contrasena |
| user[role] | {1,2,3} |

Formato JSON 
```JSON
{
    "user": {
        "username": "value",
        "email": "value",
        "password": "value",
        "role": "value",
    }
}
```

### Usuarios
| ID | USERNAME | PASSWORD |
| ------ | ------ | ------ |
| 1 | administrador | 123456 |
| 2 | usuariorol1 | 123456 |
| 3 | usuariorol2 | 123456 |
