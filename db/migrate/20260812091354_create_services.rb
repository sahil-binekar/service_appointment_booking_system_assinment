class CreateServices < ActiveRecord::Migration[8.0]
  def change
    create_table :services do |t|
      t.string :name, null: false
      t.integer :working_hours, null: false

      t.timestamps
    end
  end
end
