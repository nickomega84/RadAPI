Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'telemetry', to: 'telemetry#create'
    end
  end
end
