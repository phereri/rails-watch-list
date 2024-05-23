# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'json'
require 'open-uri'

puts 'Cleaning database...'
Movie.destroy_all

puts 'Calling API...'
url = 'https://api.themoviedb.org/3/movie/top_rated?api_key=483be7a2ac81b2e1038f3066bd9a7448'
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)

puts 'Creating movies...'
movies['results'].each do |movie|
  Movie.create(
    title: movie['original_title'],
    overview: movie['overview'],
    rating: movie['vote_average'],
    poster_url: "https://image.tmdb.org/t/p/original#{movie['poster_path']}"
  )
  puts "Created #{movie['original_title']}"
end
puts 'Finished!'
