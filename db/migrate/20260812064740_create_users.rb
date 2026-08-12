class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name, default: "", null: false
      t.string :email, default: "", null: false
      t.integer :role
      t.string :password_digest

      t.timestamps
    end
  end
end
