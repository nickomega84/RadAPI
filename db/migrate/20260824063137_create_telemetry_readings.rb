class CreateTelemetryReadings < ActiveRecord::Migration[8.1]
  def change
    create_table :telemetry_readings do |t|
      t.references :sensor, null: false, foreign_key: true
      t.float :value
      t.datetime :recorded_at

      t.timestamps
    end
  end
end
