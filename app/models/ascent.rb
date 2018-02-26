class Ascent < ApplicationRecord
  # validates :grade, :comment, :date, :style, presence: true
  before_save :calculate_points
  belongs_to :user
  belongs_to :climbing_route
  enum style = {red_point: 0, on_sight: 150, flash: 50} 
  private


  def calculate_points
    self.points = grade[self.grade] + style[self.style]
  end

  # def style_points(style)
  #   ascent_styles[style]
  #   # if style == 'RP' 
  #   #   0
  #   # elsif style == 'OS'
  #   #   150
  #   # elsif style == 'FL'
  #   #   50
  #   # end
  # end




end
