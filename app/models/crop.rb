class Crop < ApplicationRecord
  has_many :plans, dependent: :destroy
end
