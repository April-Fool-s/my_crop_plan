class FieldSection < ApplicationRecord

  # アソシエーション
  belongs_to :field
  has_many :plans


  # バリデーション
  validates :name, presence: true
end
