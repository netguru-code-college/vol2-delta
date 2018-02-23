class ClimbingRoute < ApplicationRecord
  belongs_to :sector
  has_many :ascents
end
