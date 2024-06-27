class Genre < ApplicationRecord
  has_many :book_genres
  has_many :books, through: :book_genres

  validates :name, presence: true

  def self.ransackable_associations(auth_object = nil)
    ["book_genres", "books"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "name", "updated_at"]
  end
end
