class Ascent < ApplicationRecord
  validates :comment, length: { maximum: 500 }
  validates :date, presence: true
  before_save :calculate_points
  belongs_to :user
  belongs_to :climbing_route
  belongs_to :ascent_style

  private

  def calculate_points
    self.points = climbing_route.route_grade.points + ascent_style.points
  end
end
