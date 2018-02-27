class ClimbingRoute < ApplicationRecord
  belongs_to :sector
  has_many :ascents
  belongs_to :route_grade
end
