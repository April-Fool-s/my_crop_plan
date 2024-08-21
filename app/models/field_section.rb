class FieldSection < ApplicationRecord

  # アソシエーション
  belongs_to :field
  has_many :plans
end
