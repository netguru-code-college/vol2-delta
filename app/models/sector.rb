class Sector < ApplicationRecord
  belongs_to :crag, dependent: :destroy
  has_many :climbing_routes, dependent: :destroy
  validates :name, presence: true, length: { minimum: 4, maximum: 25 }
  validates :aspect, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
end
