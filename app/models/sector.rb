class Sector < ApplicationRecord
  belongs_to :crag
  has_many :climbing_routes
end
