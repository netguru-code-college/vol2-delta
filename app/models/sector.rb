class Sector < ApplicationRecord
  belongs_to :crag, dependent: :destroy
  has_many :climbing_routes, dependent: :destroy
end
