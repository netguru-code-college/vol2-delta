class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :top_ten, -> { order('total_points desc').take(10) }
  has_many :ascents
  validates :first_name, presence: true, length: {minimum: 3, maximum: 10}
  validates :last_name, presence: true, length: {minimum: 3, maximum: 10}
end
