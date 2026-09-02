module Api
  module V1
    class TelemetryController < ApplicationController
      
      def create
        sensor = Sensor.find_by(serial_number: telemetry_params[:serial_number])

        if sensor.nil?
          render json: { error: "Sensor not recognized or unauthorized" }, status: :not_found
          return
        end

        reading = sensor.telemetry_readings.build(
          value: telemetry_params[:value],
          recorded_at: telemetry_params[:recorded_at] || Time.current
        )

        if reading.save

          if reading.value >= sensor.alert_threshold
            ::EmergencyAlertJob.perform_async(sensor.serial_number, reading.value, sensor.alert_threshold)
          end

          render json: { status: "success", data: reading }, status: :created
        else
          render json: { status: "error", message: reading.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def telemetry_params
        params.require(:telemetry).permit(:serial_number, :value, :recorded_at)
      end
    end
  end
end