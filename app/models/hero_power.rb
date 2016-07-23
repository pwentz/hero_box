class HeroPower < ActiveRecord::Base
  belongs_to :hero
  belongs_to :power
end
