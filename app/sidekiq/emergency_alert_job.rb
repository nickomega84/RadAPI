class EmergencyAlertJob
    include Sidekiq::Job

    def perform(serial_number, value, threshold)
        puts "🚨 [CRITICAL ALERT] 🚨 Sensor #{serial_number} breached safety threshold!"
        puts "Reading: #{value} (Threshold: #{threshold})"
      # For a future email or SMS
    end
end
