class Hero < ActiveRecord::Base
  has_secure_password
  has_many :stopped_crimes
  has_many :hero_powers
  has_many :powers, through: :hero_powers
  validates :name, presence: true, uniqueness: true
  before_create :assign_default_avatar
  after_initialize :set_role

  enum role: %w(default admin)

  def assign_default_avatar
    self.image_url ||= "https://robohash.org/#{rand(1000)}"
  end

  def set_role
    self.role ||= 0
  end

  def add_power(power)
    powers << power
  end

  def purchase?(power)
    wallet > power.cost
  end

  def wallet
    stopped_crimes.unredeemed.count
  end
end
