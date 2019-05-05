class RouteGrade < ApplicationRecord
  has_one :climbing_route
  validates :grade, presence: true, length: { minimum: 2, maximum: 3 }
  validates :points, numericality: { only_integer: true,
                                      greater_than: 100,
                                      less_than_or_equal_to: 1250 }
end
