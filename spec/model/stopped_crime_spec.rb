require 'rails_helper'

describe StoppedCrime, :type => :model do
  context 'associations' do
    it { should belong_to(:hero) }
  end

  context "validations" do
    it { should validate_presence_of(:potential_victim)}
    it { should validate_presence_of(:location) }
  end
end
