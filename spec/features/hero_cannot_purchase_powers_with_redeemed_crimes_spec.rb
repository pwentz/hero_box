require 'rails_helper'
#As a hero,
#when I go to purchase a power,
#and I have enough stopped crimes to pay for the power,
#but I don't have enough valid stopped crimes to pay for that power,
#I expect to NOT be able to purchase that power,
#and I expect to know that by looking at my number of unredeemed crimes

describe 'Hero cannot purchase powers w/ redeemed crimes', :type => :feature do
  scenario 'they should not be able to see purchase power button' do
    hero = create(:hero)
    stopped_crime_one,
      stopped_crime_two = create_list(:stopped_crime, 2, :hero => hero)
    power_one = create(:power, :cost => 1)
    power_two = create(:power, :cost => 2)
    allow_any_instance_of(
      ApplicationController
    ).to receive(:current_hero).and_return(hero)

    visit power_path(power_one)
    click_link 'Purchase power'

    click_link 'View all potential powers'
    click_link power_two.name

    expect(
      page.find_link('Purchase power').disabled?
    ).to eq(true)
  end

  scenario 'they should be to see their number of unredeemed crimes' do
    hero = create(:hero)
    stopped_crime_one,
      stopped_crime_two,
        stopped_crime_three = create_list(:stopped_crime, 3, :hero => hero)
    power_one = create(:power, :cost => 1)
    power_two = create(:power, :cost => 2)
    allow_any_instance_of(
      ApplicationController
    ).to receive(:current_hero).and_return(hero)

    visit power_path(power_one)
    click_link 'Purchase power'

    visit power_path(power_two)

    within("#profile_thumbnail") do
      expect(page).to have_content('Unredeemed crimes left: 2')
    end
  end
end
