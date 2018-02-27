class Ascent < ApplicationRecord
  # validates :grade, :comment, :date, :style, presence: true
  before_save :calculate_points
  belongs_to :user
  belongs_to :climbing_route
  has_one :ascent_style
  # enum style = {RP: 0, OS: 150, FL: 50} 
  private


  def calculate_points(style)
  


    # self.points = self.grade + self.style
  end


end
