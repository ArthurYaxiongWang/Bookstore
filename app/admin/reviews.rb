ActiveAdmin.register Review do
  permit_params :content, :rating, :book_id

  index do
    selectable_column
    id_column
    column :content
    column :rating
    column :book
    actions
  end

  form do |f|
    f.inputs do
      f.input :content
      f.input :rating
      f.input :book
    end
    f.actions
  end
end
