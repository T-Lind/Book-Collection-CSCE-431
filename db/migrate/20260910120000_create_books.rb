class CreateBooks < ActiveRecord::Migration[8.1]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author
      t.decimal :price, precision: 8, scale: 2
      t.date :published_date

      t.timestamps
    end
  end
end
