class Manager < ApplicationRecord
  belongs_to :company
  has_many :reports
  has_many :events
end
