class Chart < ApplicationRecord
  has_many :p_values, through: :measurements
  has_many :measurements, dependent: :destroy
end
