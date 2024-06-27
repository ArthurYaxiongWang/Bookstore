ActiveAdmin.register Book do
  permit_params :title, :description, :date

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :date
    column :authors do |book|
      book.authors.map(&:name).join(", ")
    end
    actions
  end

  filter :title
  filter :description
  filter :date
  filter :authors, as: :select, collection: proc { Author.all }
  filter :genres, as: :select, collection: proc { Genre.all }
end

