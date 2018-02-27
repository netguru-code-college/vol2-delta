class Ascent < ApplicationRecord
  # validates :grade, :comment, :date, :style, presence: true
  before_save :calculate_points
  belongs_to :user
  belongs_to :climbing_route
  belongs_to :ascent_style

  private


  def calculate_points
  self.points = self.climbing_route.route_grade.points + self.ascent_style.points
  end
end
