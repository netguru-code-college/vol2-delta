class ClimbingRoute < ApplicationRecord
  belongs_to :sector
  has_many :ascents
  has_one :route_grade
end
