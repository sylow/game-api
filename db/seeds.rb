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

Convention.create([
        { name: 'Forcing Bids', user: User.first },
        { name: 'Stayman', user: User.first },
])

Block.create([
        {
                convention: Convention.first,
                title: 'Principle #1: The only opening bid which is forcing is two clubs',
                description: 'This is artificial and has nothing to do with clubs. With 
                very rare exceptions partner will respond 2D and opener now bids his suit 
                or notrump as the case may be.',
                bidding: [
                        ['2C', '2D'], ['2S', '']
                ],
        },
        {
                convention: Convention.first,
                title: 'Principle #2: A new suit by responder is forcing for one round.',
                description: 'East may have only 6 points but he may have much more. His 
                hand is virtually unlimted and West is obligated to give him another 
                chance to bid.',
                bidding: [
                        ['1C', '1H']
                ],
        },
        {
                convention: Convention.first,
                description: "East's bid of 2D is forcing, although not to the game.",
                bidding: [
                        ['1C', '1H'],
                        ['1C', '2D']
                ],
        },
        {
                convention: Convention.first,
                description: "When opener has rebid 1N a new suit by responder is not forcing.
                Here East has a weak two-suiter which will not play well in notrump. He could hold
                SS K 7 6 5 2 HH Q 9 8 6 2 DD 6 CC J 5",
                bidding: [
                        ['1C', '1S'],
                        ['1N', '2H']
                ],
        }                         
])