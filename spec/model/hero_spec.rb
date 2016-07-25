require 'rails_helper'

describe Hero, :type => :model do
  context "associations" do
    it { should have_many(:stopped_crimes) }
  end

  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:password) }
  end
end
