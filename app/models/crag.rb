class Crag < ApplicationRecord
  validates :name,  presence: true
  validates :country,  presence: true
  validates :latitude,  presence: true
  validates :longitude,  presence: true
  has_many :sectors, dependent: :destroy
end
