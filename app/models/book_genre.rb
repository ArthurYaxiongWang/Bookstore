class BookGenre < ApplicationRecord
  belongs_to :book
  belongs_to :genre

  def self.ransackable_attributes(auth_object = nil)
    ["book_id", "created_at", "genre_id", "id", "id_value", "updated_at"]
  end
end
