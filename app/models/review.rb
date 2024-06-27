class Review < ApplicationRecord
  belongs_to :book

  validates :content, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  def self.ransackable_associations(auth_object = nil)
    ["book"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["book_id", "content", "created_at", "id", "id_value", "rating", "updated_at"]
  end
end
