# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([
        { username: 'gokhan', password: '123456'},    
        { username: 'sahin', password: '123456'},
        { username: 'ahmet', password: '123456'},
        { username: 'hakan', password: '123456'},
        { username: 'ulas', password: '123456'},       
])

List.create(user: User.first, name: 'Practice')