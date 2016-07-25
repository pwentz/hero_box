require 'rails_helper'

#As an admin
#when I visit my dashboard
#and I click the 'Potential Powers' link
#I expect to see all existing potential powers
#on the page
#

describe 'Admin can see all potential powers', :type => :feature do
  scenario 'they can visit powers path from dashboard' do
    admin = create(:hero, :role => 1)
    allow_any_instance_of(
      ApplicationController
    ).to receive(:current_hero).and_return(admin)

    visit admin_heros_path

    click_link 'Potential Powers'

    expect(current_path).to eq(admin_powers_path)
  end

  scenario 'they can see any existing powers' do
    admin = create(:hero, :role => 1)
    power_one,
      power_two = create_list(:power, 2)
    allow_any_instance_of(
      ApplicationController
    ).to receive(:current_hero).and_return(admin)

    visit admin_powers_path

    within("#powers_list") do
      expect(page).to have_link(power_one.name)
      expect(page).to have_link(power_two.name)
    end
  end
end
