class Measurement < ApplicationRecord
  has_many: :p_values, dependent: :destroy
  belongs_to: :chart
end
