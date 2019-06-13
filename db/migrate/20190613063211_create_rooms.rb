class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :active_user_id
      t.integer :passive_user_id

      t.timestamps
    end
    add_index :rooms, :active_user_id
    add_index :rooms, :passive_user_id
    add_index :rooms, [:active_user_id, :passive_user_id], unique: true
  end
end
