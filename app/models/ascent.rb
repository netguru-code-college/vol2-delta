class Ascent < ApplicationRecord
  validates :comment, length: { maximum: 500 }
  validates :date, presence: true
  belongs_to :user
  belongs_to :climbing_route
  belongs_to :ascent_style
end
