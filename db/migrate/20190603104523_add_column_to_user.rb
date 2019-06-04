class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :name, :string
  	add_column :users, :game_category, :integer
  	add_column :users, :play_time, :integer
  	add_column :users, :introduction, :string
  end
end
