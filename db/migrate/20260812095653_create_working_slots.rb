class CreateWorkingSlots < ActiveRecord::Migration[8.0]
  def change
    create_table :working_slots do |t|
      t.timestamps
    end
  end
end
