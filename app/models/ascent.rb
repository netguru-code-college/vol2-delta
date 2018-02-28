class Ascent < ApplicationRecord
  validates :comment, length: { maximum: 500 }
  validates :date, presence: true
  before_save :calculate_points
  after_save :calculate_user_total_points
  belongs_to :user
  belongs_to :climbing_route
  belongs_to :ascent_style

  private

  def calculate_points
    AscentCalculations::CalculatePoints.new(ascent: self).call
  end

  def calculate_user_total_points
    AscentCalculations::CalculateUserTotalPoints.new(ascent: self).call
  end
end
