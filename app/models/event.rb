class Event < ApplicationRecord
  validates :title, presence: true
  validates :month, presence: true, inclusion: { in: 1..12 }

  scope :ordered, -> { order(:position) }
end
