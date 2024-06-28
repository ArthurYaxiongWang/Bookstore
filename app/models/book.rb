class Book < ApplicationRecord
  has_many :authorships
  has_many :authors, through: :authorships
  has_many :book_genres
  has_many :genres, through: :book_genres
  has_many :reviews

  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true

  def self.ransackable_associations(auth_object = nil)
    ["authors", "authorships", "book_genres", "genres", "reviews"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["title", "description", "date"]
  end

end
