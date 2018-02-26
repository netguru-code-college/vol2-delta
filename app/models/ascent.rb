class Ascent < ApplicationRecord
  # validates :grade, :comment, :date, :style, presence: true
  before_save :calculate_points
  belongs_to :user
  belongs_to :climbing_route
  private
  def calculate_points
    self.points = self.grade.to_i + style_points(self.style)
  end

  def style_points(style)
    if style == 'RP' 
      0
    elsif style == 'OS'
      150
    elsif style == 'FL'
      50
    end
  end
end
