class ClimbingRoute < ApplicationRecord
  validates :name,  presence: true
  belongs_to :sector
  has_many :ascents
end
