class Hero < ActiveRecord::Base
  has_secure_password
  has_many :stopped_crimes
  has_many :hero_powers
  has_many :powers, through: :hero_powers
  validates :name, presence: true, uniqueness: true
  validates :hometown, presence: true
  after_initialize :assign_avatar

  enum role: %w(default admin)

  def assign_avatar
    self.image_url ||= Faker::Avatar.image("150x150")
  end

  def add_power(power)
    powers << power
  end
end
