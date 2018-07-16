class CreateStickers < ActiveRecord::Migration[5.1]
  def change
    create_table :stickers do |t|
      t.string :title
      t.string :description
      t.string :image_url
      t.integer :rating
      t.references :user, foreign_key: true
    end
  end
end
