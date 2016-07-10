class Page < ApplicationRecord
  default_scope { order('updated_at DESC') }
  belongs_to :user

  validates :title, presence: true
end
