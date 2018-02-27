class ClimbingRoute < ApplicationRecord
  belongs_to :sector, dependent: :destroy
  has_many :ascents, dependent: :nullify
  belongs_to :route_grade
end
