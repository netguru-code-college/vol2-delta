class Sector < ApplicationRecord
  belongs_to :crag
  has_many :routes
end
