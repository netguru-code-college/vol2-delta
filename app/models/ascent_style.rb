class AscentStyle < ApplicationRecord
  has_many :ascents

  validates :style, presence: true, length: { is: 2 }
  validates :points, numericality:
                                    {
                                      only_integer: true,
                                      greater_than_or_equal_to: 0,
                                      less_than_or_equal_to: 150
                                    }
end
