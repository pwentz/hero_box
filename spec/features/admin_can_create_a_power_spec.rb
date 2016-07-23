require 'rails_helper'

#As an admin
#when I go to my dashboard
#and I click the 'create power' button
#and I fill in the name and cost forms
#and I click submit
#I expect to be able to see my new power
#and any other existing powers on the page

describe 'Admin can create power', :type => :feature do
  scenario 'they can go to new power page from dashboard' do
    admin = create(:hero, :role => 1)
    allow_any_instance_of(
      ApplicationController
    ).to receive(:current_hero).and_return(admin)

    visit admin_heros_path
    click_link 'Create Power'

    expect(current_path).to eq(new_admin_power_path)
  end

  scenario 'they can see new power (and existing) after submit form' do
    admin = create(:hero, :role => 1)
    existing_power = create(:power)
    power_name = Faker::Superhero.power
    power_cost = 50
    power_iamge = Faker::Avatar.image
    allow_any_instance_of(
      ApplicationController
    ).to receive(:current_hero).and_return(admin)

    visit new_admin_power_path

    within(".new_power") do
      fill_in "power[name]", with: power_name
      fill_in "power[cost]", with: power_cost

      click_button 'Create Power'
    end

    within("#powers_list") do
      expect(page).to have_link(existing_power.name)
      expect(page).to have_link(power_name)
    end
  end
end
