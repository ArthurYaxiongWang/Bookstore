class Author < ApplicationRecord
  has_many :authorships
  has_many :books, through: :authorships

  validates :name, presence: true
  validates :bio, presence: true
end
