class QaItem < ApplicationRecord
  validates :question, presence: true
  validates :answer, presence: true

  scope :ordered, -> { order(:position) }
end
