class AddLockableToUsers2 < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.string  :unlock_token
    end
    add_index :users, :unlock_token, unique: true
  end
end
