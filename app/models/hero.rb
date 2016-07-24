class Hero < ActiveRecord::Base
  has_secure_password
  has_many :stopped_crimes
  has_many :hero_powers
  has_many :powers, through: :hero_powers
  validates :name, presence: true, uniqueness: true
  validates :hometown, presence: true
  after_initialize :assign_defaults

  enum role: %w(default admin)

  def assign_defaults
    self.image_url ||= "https://robohash.org/#{rand(1000)}"
    self.role ||= 0
  end

  def add_power(power)
    powers << power
  end

end
