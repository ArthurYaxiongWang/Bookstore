ActiveAdmin.register Author do
  permit_params :name, :bio

  index do
    selectable_column
    id_column
    column :name
    column :bio
    column :books do |author|
      author.books.map(&:title).join(", ")
    end
    actions
  end

  filter :name
  filter :bio
  filter :books, as: :select, collection: proc { Book.all }
end
