class AddBannedToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :banned, :boolean, default: false, null: false
  end

  def down
    remove_column :users, :banned
  end
end
