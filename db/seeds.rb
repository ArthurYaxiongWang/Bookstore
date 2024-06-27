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

# Clear existing data
Author.destroy_all
Book.destroy_all
Genre.destroy_all
Review.destroy_all
Authorship.destroy_all
BookGenre.destroy_all

# Create authors
10.times do
  Author.create(name: Faker::Book.author, bio: Faker::Lorem.paragraph)
end

# Create genres
5.times do
  Genre.create(name: Faker::Book.genre)
end

# Create books
20.times do
  Book.create(title: Faker::Book.title, description: Faker::Lorem.paragraph, date: Faker::Date.between(from: 50.years.ago, to: Date.today))
end

# Create reviews
Book.all.each do |book|
  rand(1..5).times do
    Review.create(content: Faker::Lorem.paragraph, rating: rand(1..5), book: book)
  end
end

# Create authorships and book genres
Book.all.each do |book|
  authors = Author.order('RANDOM()').limit(rand(1..3))
  authors.each do |author|
    Authorship.create(author: author, book: book)
  end

  genres = Genre.order('RANDOM()').limit(rand(1..2))
  genres.each do |genre|
    BookGenre.create(book: book, genre: genre)
  end
end
