class Report < ApplicationRecord
  belongs_to :company
  belongs_to :manager
  has_many :events

  validates :company, presence: true
  validates :manager, presence: true
  validates :preferred_day, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 7 }
  validates :preferred_hour, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 9, less_than: 17 }
end
