class Field < ApplicationRecord

  # アソシエーション
  belongs_to :user
  has_many :field_sections, dependent: :destroy

  # 子モデル（plan_details）の属性を受入れ、更新や削除を許可する
  accepts_nested_attributes_for :field_sections, allow_destroy: true
end
