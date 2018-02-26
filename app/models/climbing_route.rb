class ClimbingRoute < ApplicationRecord
  validates :name,  presence: true
  validates :grade, inclusion: { in: RouteGrades,
                    message: "%{value} is not a valid grade" },
                    presence: true
  belongs_to :sector
  has_many :ascents
  has_one :route_grade
end
