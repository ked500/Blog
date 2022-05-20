class CreateMicroposts < ActiveRecord::Migration[7.0]
  def change
    create_table :microposts do |t|
      t.text :content
      t.references :user, index: true, null: false, foreign_key: true

      t.timestamps null: false
    end
    add_index :microposts, [:user_id, :created_at]
  end
end
