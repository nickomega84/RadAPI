class CreateSensors < ActiveRecord::Migration[8.1]
  def change
    create_table :sensors do |t|
      t.references :facility, null: false, foreign_key: true
      t.string :serial_number
      t.string :measurement_type
      t.float :alert_threshold

      t.timestamps
    end
  end
end
