# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

require 'faker'
require 'csv'
require 'net/http'
require 'json'

# Create Genres
10.times do
  Genre.create(name: Faker::Book.genre)
end

# Create Authors
20.times do
  Author.create(
    name: Faker::Book.author,
    bio: Faker::Lorem.paragraph
  )
end

# Create Books from an API (example: Open Library API)
url = 'https://openlibrary.org/subjects/science_fiction.json?limit=20'
uri = URI(url)
response = Net::HTTP.get(uri)
books = JSON.parse(response)["works"]

books.each do |book|
  b = Book.create(
    title: book["title"],
    description: Faker::Lorem.paragraph,
    publication_date: Faker::Date.between(from: '1900-01-01', to: '2023-01-01')
  )
  # Associate random authors
  b.authors << Author.order('RANDOM()').limit(2)
  # Associate random genres
  b.genres << Genre.order('RANDOM()').limit(2)
end

# Create Reviews for each book
Book.all.each do |book|
  5.times do
    Review.create(
      content: Faker::Lorem.paragraph,
      rating: rand(1..5),
      book: book
    )
  end
end
