class GuestbookPost < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  accepts_nested_attributes_for :trip
end
