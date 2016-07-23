require 'rails_helper'

describe Power, :type => :model do
  context 'associations' do
    it { should have_many(:heros).through(:hero_powers) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:cost) }
  end
end
