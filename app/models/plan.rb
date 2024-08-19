class Plan < ApplicationRecord
  belongs_to :user
  belongs_to :field
  belongs_to :crop
  belongs_to :field_section
end
