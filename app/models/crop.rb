class Crop < ApplicationRecord

  # アソシエーション
  belongs_to :user

  # バリデーション
  validates :name, presence: true
  validates :plant_family, presence: true
  validates :rotation_year, presence: true
end