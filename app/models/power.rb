class Power < ActiveRecord::Base
  has_many :hero_powers
  has_many :heros, through: :hero_powers
  validates :name, presence: true, uniqueness: true
  validates :cost, presence: true
end
