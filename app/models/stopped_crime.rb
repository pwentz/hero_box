class StoppedCrime < ActiveRecord::Base
  belongs_to :hero
  validates :potential_victim, presence: true
  validates :location, presence: true
end
