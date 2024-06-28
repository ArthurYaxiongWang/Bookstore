class Author < ApplicationRecord
  has_many :authorships
  has_many :books, through: :authorships

  validates :name, presence: true
  validates :bio, presence: true

  def self.ransackable_associations(auth_object = nil)
    ["authorships", "books"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name", "bio"]
  end

  has_one_attached :profile_picture
end
