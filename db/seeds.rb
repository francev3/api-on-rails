# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


administrador = User.create(email: 'administrador@administrador.com', username: 'administrador', role:1, password: '123456') 
rol1 = User.create(email: 'rol1@rol.com', username: 'rol1', role:2, password: '123456') 
rol2 = User.create(email: 'rol2@rol.com', username: 'rol2', role:2, password: '123456')
