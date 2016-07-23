class Hero < ActiveRecord::Base
  has_secure_password
  has_many :stopped_crimes
  has_many :hero_powers
  has_many :powers, through: :hero_powers
  validates :name, presence: true, uniqueness: true
  validates :hometown, presence: true
  validates :image_url, presence: true

  enum role: %w(default admin)

  def add_power(power)
    powers << power
  end
end
