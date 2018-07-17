class AddQuantityToStickers < ActiveRecord::Migration[5.1]
  def change
    add_column :stickers, :quantity, :integer
  end
end
