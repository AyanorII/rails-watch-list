require 'open-uri'

start_time = Time.now
List.destroy_all
Movie.destroy_all

15.times do
  List.create!(name: Faker::Book.unique.genre)
end
puts "Created #{List.count} lists"

url = 'http://tmdb.lewagon.com/movie/top_rated'
response = JSON.parse(URI.open(url).read)

response['results'].each do |movie_hash|
  # create an instance with the hash
  Movie.create!(
    poster_url: 'https://image.tmdb.org/t/p/w500' + movie_hash['poster_path'],
    title: movie_hash['title'],
    overview: movie_hash['overview'],
    rating: movie_hash['vote_average']
  )
end
puts "Created #{Movie.count} movies"

25.times do
  Bookmark.create!(comment: Faker::Quote.most_interesting_man_in_the_world, movie_id: Movie.all.sample.id,
                   list_id: List.all.sample.id)
end
puts "Created #{Bookmark.count} bookmarks"
end_time = Time.now
puts "Time: #{end_time - start_time}"
