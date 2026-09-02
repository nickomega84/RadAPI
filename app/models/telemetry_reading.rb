class TelemetryReading < ApplicationRecord
  belongs_to :sensor

  validates :value, presence: true, numericality: true
  validates :recorded_at, presence: true
end
