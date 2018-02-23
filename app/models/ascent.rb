class Ascent < ApplicationRecord
  validates :grade, :comment, :date, :style, presence: true
  belongs_to :user
  belongs_to :climbing_route
end
