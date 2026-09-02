TelemetryReading.destroy_all
Sensor.destroy_all
Facility.destroy_all

reactor_alpha = Facility.create!(
  name: "Reactor Alpha - Ruse Central", 
  status: "active"
)

reactor_beta = Facility.create!(
  name: "Reactor Beta - Santa Maria Central", 
  status: "active"
)

Sensor.create!(
  serial_number: "RAD-X-99",
  measurement_type: "radiation_sieverts",
  alert_threshold: 0.05,
  facility: reactor_alpha
)

Sensor.create!(
  serial_number: "TEMP-Y-42",
  measurement_type: "temperature_celsius",
  alert_threshold: 85.0,
  facility: reactor_beta
)

puts "🟢 Installations and nuclear reactors successfully deployed!"