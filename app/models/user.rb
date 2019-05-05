class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

  scope :top_ten, -> { order('total_points desc').take(10) }
  has_many :ascents
  validates :first_name, presence: true, length: { minimum: 2, maximum: 15 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 15 }
end
