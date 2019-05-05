class Ascent < ApplicationRecord
  belongs_to :user
  belongs_to :climbing_route
  belongs_to :ascent_style

  validates :comment, length: { maximum: 500 }
  validates :date, presence: true
end
