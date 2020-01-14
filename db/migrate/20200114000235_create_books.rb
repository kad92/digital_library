class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.references :category, null: false, foreign_key: true
      t.string :author
      t.string :isbn
      t.string :edition
      t.string :format
      t.string :publisher
      t.string :description
      t.string :condition

      t.timestamps
    end
  end
end
