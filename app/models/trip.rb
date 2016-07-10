class Trip < ApplicationRecord
  validates :started_at, :ended_at, presence: true
end
