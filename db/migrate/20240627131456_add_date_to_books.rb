class AddDateToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :date, :date
  end
end
