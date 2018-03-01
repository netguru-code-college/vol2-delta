class Crag < ApplicationRecord
  validates :name,  presence: true
  has_many :sectors, dependent: :destroy
  validates :country, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
  
end
