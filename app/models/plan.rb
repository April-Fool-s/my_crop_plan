class Plan < ApplicationRecord
  belongs_to :user
  belongs_to :field
  belongs_to :field_section
  has_many :plan_crops, dependent: :destroy

  # 子モデル（plan_crops）の属性を受入れ、更新や削除を許可する
  accepts_nested_attributes_for :plan_crops, allow_destroy: true

  # バリデーション
  validates :year, presence: true
end