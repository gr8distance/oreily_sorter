class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :isbn
      t.integer :price
      t.date :published_on
      t.string :title

      t.timestamps
    end
  end
end
