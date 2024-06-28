# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

require 'faker'

AdminUser.destroy_all
Author.destroy_all
Book.destroy_all
Genre.destroy_all
Review.destroy_all
Authorship.destroy_all
BookGenre.destroy_all

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if AdminUser.count == 0

10.times do
  Author.create!(
    name: Faker::Book.author,
    bio: Faker::Lorem.sentence
  )
end

5.times do
  Genre.create!(
    name: Faker::Book.genre
  )
end

50.times do
  book = Book.create!(
    title: Faker::Book.title,
    description: Faker::Lorem.paragraph,
    date: Faker::Date.backward(days: 365)
  )

  Authorship.create!(
    author: Author.all.sample,
    book: book
  )

  BookGenre.create!(
    book: book,
    genre: Genre.all.sample
  )

  3.times do
    Review.create!(
      content: Faker::Lorem.sentence,
      rating: rand(1..5),
      book: book
    )
  end
end

puts "Seeded #{Author.count} authors, #{Book.count} books, #{Genre.count} genres, #{Review.count} reviews, #{Authorship.count} authorships, #{BookGenre.count} book genres, #{AdminUser.count} admin users"
