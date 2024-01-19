class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :isbn, null: false
      t.integer :price, null: false
      t.date :published_on, null: false

      t.timestamps
    end
  end
end
