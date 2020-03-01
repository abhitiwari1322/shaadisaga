class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, :null => false
      t.string :phone
      t.string :email

    end
  end
end
