class ClimbingRoute < ApplicationRecord
  validates :name,  presence: true

  belongs_to :sector
  has_many :ascents
  has_one :route_grade

  scope :in_crag_and_sector,
        lambda { |sector_id, crag_id|
          joins(:sector)
            .where(sector_id: sector_id)
            .where('sectors.crag_id = ?', crag_id)
        }
end
