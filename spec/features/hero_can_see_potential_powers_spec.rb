require 'rails_helper'

# As a user,
# when I go to my dashboard
# and I click the 'see potential powers' button
# I should see a list all of the powers and the price
# and I should be able to click on any power
# and be taken to a page w/ more details
#

describe 'Hero can see potential powers' do
  scenario 'they should be able to visit from their dashboard' do
    hero = create(:hero)
    allow_any_instance_of(
      ApplicationController
    ).to receive(:current_hero).and_return(hero)

    visit hero_stopped_crimes_path(hero) 
    click_link 'Potential Powers'

    expect(current_path).to eq(powers_path)
  end

  scenario 'they can see all potential powers and cost' do
    hero = create(:hero)
    power_one,
      power_two = create_list(:power, 2)
    allow_any_instance_of(
      ApplicationController
    ).to receive(:current_hero).and_return(hero)

    visit powers_path

    within("#powers_list") do
      expect(page).to have_link(power_one.name)
      expect(page).to have_text(power_one.cost)
      expect(page).to have_link(power_two.name)
      expect(page).to have_text(power_two.cost)
    end
  end
end
