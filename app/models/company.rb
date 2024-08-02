class Company < ApplicationRecord
  has_many :managers
  has_many :reports
end
