# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.new
user1.email = 'user1@example.com'
user1.name = 'Theo Faure'
user1.image = 'http://www.monchatonetmoi.com/upload/images/chaton-coquin-sur-clavier-d-ordinateur.jpg'
user1.password = 'coucou'
user1.password_confirmation = 'coucou'
user1.admin = true
user1.save!

user2 = User.new
user2.email = 'user2@example.com'
user2.name = 'Alejandra '
user2.image = 'http://ctoc.consostatic.com/images/media/demande/large/000/140/122/beau-chaton-moins-de-3-mois.jpg'
user2.password = 'coucou'
user2.password_confirmation = 'coucou'
user2.save!

tags = Tag.create([{ name: 'cat' },
                   { name: 'cute' },
                   { name: 'pink' },
                   { name: 'blue' },
                   { name: 'kitten' },
                   { name: 'lovely' }])

categories = Category.create([{ name: 'Cute kitten' },
                               { name: 'Very cute kitten' },
                               { name: 'OMG this kitten is so cute' },
                               { name: 'It\'s not even a kitten, it\'s a cat' }])

types = Type.create([{ name: 'photo' },
                     { name: 'video' }])

products = Product.create([{
                    name: 'img-chaton1',
                    image_link: 'http://static.cotemaison.fr/medias_10824/w_2048,h_1146,c_crop,x_0,y_68/w_1520,h_855,c_fill,g_north/v1456391043/10-astuces-pour-rendre-votre-chat-heureux_5542219.jpg',
                    type: types[0],
                    category: categories[0],
                    tags: [tags[0], tags[1], tags[4]]
                },{
                    name: 'img-chaton2',
                    image_link: 'http://jolabistouille.j.o.pic.centerblog.net/45777f7a.png',
                    type: types[0],
                    category: categories[1],
                    tags: [tags[1], tags[5], tags[3]]
                },{
                    name: 'img-chaton3',
                    image_link: 'http://www.chatsbio.com/wp-content/uploads/2014/07/chat-mignon-700x385.jpg',
                    type: types[0],
                    category: categories[2],
                    tags: [tags[1], tags[5]]
                },{
                    name: 'video-chaton1',
                    image_link: 'https://www.youtube.com/watch?v=Q6amwKTI9VY',
                    type: types[1],
                    category: categories[3],
                    tags: [tags[1], tags[5], tags[3], tags[4], tags[2]]
                }])

subProducts = Subproduct.create([{
                                        resolution: '200*400',
                                        price: 20.50,
                                        product: products[0]
                                    },{
                                        resolution: '400*800',
                                        price: 30.50,
                                        product: products[0]
                                    },{
                                        resolution: '800*1600',
                                        price: 40.50,
                                        product: products[0]
                                    },{
                                        resolution: '200*400',
                                        price: 20.50,
                                        product: products[1]
                                    },{
                                        resolution: '200*400',
                                        price: 30.50,
                                        product: products[1]
                                    },{
                                        resolution: '200*400',
                                        price: 40.50,
                                        product: products[1]
                                    },{
                                        resolution: '200*400',
                                        price: 20.50,
                                        product: products[2]
                                    },{
                                        resolution: '200*400',
                                        price: 30.50,
                                        product: products[2]
                                    },{
                                        resolution: '200*400',
                                        price: 40.50,
                                        product: products[2]
                                    },{
                                        resolution: '480p',
                                        price: 50.99,
                                        product: products[3]
                                    },{
                                        resolution: '720p',
                                        price: 70.99,
                                        product: products[3]
                                    }])




