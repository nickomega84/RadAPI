class Sensor < ApplicationRecord
  belongs_to :facility
  has_many :telemetry_readings, dependent: :destroy

  validates :serial_number, presence: true, uniqueness: true
  validates :measurement_type, presence: true, inclusion: {
      in: %w[radiation_sieverts temperature_celsius pressure_bar],
      message: "%{value} is not a recognized industrial metric"
    }
  validates :alert_threshold, presence: true, numericality: { greater_than: 0 }
end
