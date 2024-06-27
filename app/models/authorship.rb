class Authorship < ApplicationRecord
  belongs_to :author
  belongs_to :book

  def self.ransackable_attributes(auth_object = nil)
    ["author_id", "book_id", "created_at", "id", "id_value", "updated_at"]
  end
end
