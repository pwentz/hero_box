class Hero < ActiveRecord::Base
  has_many :stopped_crimes
  has_secure_password
  validates :name, presence: true, uniqueness: true
  validates :hometown, presence:true

  enum role: %w(default admin)
end
