class StoppedCrime < ActiveRecord::Base
  belongs_to :hero
  validates :crime, presence: true
  validates :potential_victim, presence: true
  validates :location, presence: true

  enum role: %w(default redeemed)

  def self.redeem_for_purchase(power)
    where(:role => 0).first(power.cost.to_i).each do |unredeemed_crime|
      unredeemed_crime.update_attribute(:role, 1)
    end
    all.first.hero.add_power(power)
  end
end
