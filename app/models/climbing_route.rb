class ClimbingRoute < ApplicationRecord
  belongs_to :route_grade
  belongs_to :sector, dependent: :destroy
  has_many :ascents, dependent: :nullify
  
  validates :name, presence: true, length: { minimum: 3, maximum: 30 }

  scope :in_crag_and_sector, ->(sector_id, crag_id) do
    joins(:sector)
      .where(sector_id: sector_id)
      .where('sectors.crag_id = ?', crag_id)
  end

  scope :show_all_climbing_routes,
        -> {
          eager_load(sector: :crag)
            .all
            .order(:name)
        }
end
