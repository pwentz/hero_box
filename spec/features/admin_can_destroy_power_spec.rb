require 'rails_helper'

#As an admin
#when I visit an individual power's page
#and I click 'Destroy this power'
#I should see other existing powers, except the the one destroyed

describe 'Admin can destroy powers', :type => :feature do
  scenario 'they can destroy from power show page' do
    admin = create(:hero, :role => 1)
    existing_power = create(:power)
    allow_any_instance_of(
      ApplicationController
    ).to receive(:current_hero).and_return(admin)

    visit admin_power_path(existing_power)

    expect(page).to have_link('Destroy this power')
  end

  scenario 'they can see other powers except for destroyed' do
    admin = create(:hero, :role => 1)
    existing_power_one,
      existing_power_two = create_list(:power, 2)
    allow_any_instance_of(
      ApplicationController
    ).to receive(:current_hero).and_return(admin)

    visit admin_power_path(existing_power_one)

    click_link 'Destroy this power'

    within("#powers_list") do
      expect(page).to have_link(existing_power_two.name)
      expect(page).not_to have_link(existing_power_one.name)
    end
  end
end
