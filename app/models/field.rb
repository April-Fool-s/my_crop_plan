class Field < ApplicationRecord

  # アソシエーション
  belongs_to :user
  has_many :field_sections, dependent: :destroy
  has_many :plans, dependent: :destroy

  # 子モデル（field_sections）の属性を受入れ、更新や削除を許可する
  accepts_nested_attributes_for :field_sections, allow_destroy: true

  # バリデーション
  validates :name, presence: true
end
