class Crag < ApplicationRecord
  has_many :sectors, dependent: :destroy
end
