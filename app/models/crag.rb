class Crag < ApplicationRecord
  has_many :sectors, dependent: :destroy

  validates :name, presence: true
  validates :country, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
end
