class Ascent < ApplicationRecord
  validates :grade, :comment, :date, :style, presence: true
  belongs_to :user
  belongs_to :route
end
