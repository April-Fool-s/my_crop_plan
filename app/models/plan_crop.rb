class PlanCrop < ApplicationRecord

  # アソシエーション
  belongs_to :plan

  # バリデーション
  validates :name, presence: true
  validates :planting_method, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
