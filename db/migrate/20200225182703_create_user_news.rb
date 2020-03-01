class CreateUserNews < ActiveRecord::Migration[5.2]
  def change
    create_table :user_news do |t|
      t.integer :user_id
      t.integer :news_id
      t.integer :is_read, :limit => 1, :default => 0
      t.integer :is_deleted, :limit => 1, :default => 0

      t.timestamps
    end
    add_index :user_news, [:user_id,:news_id]
  end
end
