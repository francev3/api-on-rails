# API ON RAILS

### Instalacion
Dentro de la carpeta raiz api-on-rails ejecutar:
```bash
$ docker-compose up -d
$ docker-compose exec app bundle exec rake db:setup db:migrate
```

### Ejecutar los tests:
```sh
$ docker-compose exec app rails db:test:purge
$ docker-compose exec app bundle exec rails spec
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
| username | Nombre de usuario del usuario |
| email | Correo del usuario  |
| password | Contrasena |
| role | {1,2,3} |

### Usuarios
| ID | USERNAME | PASSWORD |
| ------ | ------ | ------ |
| 1 | administrador | 123456 |
| 2 | usuariorol1 | 123456 |
| 3 | usuariorol2 | 123456 |
