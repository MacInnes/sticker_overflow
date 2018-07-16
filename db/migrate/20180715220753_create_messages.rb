class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :header
      t.string :body
      t.integer :user_from_id
      t.integer :user_to_id
    end
  end
end
