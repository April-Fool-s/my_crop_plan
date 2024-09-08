class FieldSection < ApplicationRecord

  # アソシエーション
  belongs_to :field
  has_many :plans, dependent: :destroy


  # バリデーション
  validates :name, presence: true
end
