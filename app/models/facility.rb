class Facility < ApplicationRecord
    has_many :sensors, dependent: :destroy

    validates :name, presence: true, uniqueness: true
    validates :status, presence: true, inclusion: {
        in: %w[active maintenance emergency offline],
        message: "%{value} is not a valid facility status"
    }
end