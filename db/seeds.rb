# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning the database...'
Bookmark.delete_all
Movie.delete_all
List.delete_all

wonder = Movie.new(title: 'Wonder Woman 1984',
                   overview: 'Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s', poster_url: 'https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg', rating: 6.9)
wonder.save!

shawshank = Movie.new(title: 'The Shawshank Redemption',
                      overview: 'Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison', poster_url: 'https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg', rating: 8.7)
shawshank.save!

titanic = Movie.new(title: 'Titanic',
                    overview: '101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.', poster_url: 'https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg', rating: 7.9)
titanic.save!

ocean = Movie.new(title: "Ocean's Eight",
                  overview: 'Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.', poster_url: 'https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg', rating: 7.0)
ocean.save!

puts "Created #{Movie.count} movies"

drama = List.new(name: 'Drama')
drama.save!

favourites = List.new(name: 'All time favourites')
favourites.save!

girl = List.new(name: 'Girl Power')
girl.save!

puts "Created #{List.count} lists"

Bookmark.create!(comment: 'Recommended by John', movie_id: titanic.id, list_id: drama.id)
Bookmark.create!(comment: 'Superhero movie revisited in 2020', movie_id: wonder.id, list_id: girl.id)
Bookmark.create!(comment: "Spielberg's masterly Oscar-winning drama", movie_id: shawshank.id, list_id: favourites.id)
Bookmark.create!(comment: '2020 release', movie_id: ocean.id, list_id: drama.id)

puts "Created #{Bookmark.count} bookmarks"
