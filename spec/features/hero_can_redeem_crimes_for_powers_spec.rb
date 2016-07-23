require 'rails_helper'

#As a hero,
#when I visit and individual power's page,
#and I have more (default) stopped crimes than the cost of this power
#and I click the 'Purchase power' button
#I expect that (cost of power) number of my stopped crimes to now be 'redeemed'
#and I expect to now see my newly purchase power on my dashboard
#

describe 'Hero can redeem stopped crimes for powers' do
  context 'they have more stopped crimes than cost of power' do
    scenario 'they see purchase button on page' do
      hero = create(:hero)
      create_list(:stopped_crime, 3, :hero => hero)
      power = create(:power, :cost => 2)
      allow_any_instance_of(
        ApplicationController
      ).to receive(:current_hero).and_return(hero)

      visit power_path(power)

      expect(page).to have_link('Purchase power')
    end

    scenario 'they click button and number of crimes = cost are redeemed' do
      hero = create(:hero)
      create_list(:stopped_crime, 3, :hero => hero)
      power = create(:power, :cost => 2)
      allow_any_instance_of(
        ApplicationController
      ).to receive(:current_hero).and_return(hero)

      visit power_path(power)


      expect{
        click_link 'Purchase power'
      }.to change{hero.stopped_crimes.where(role: 0).count}.from(3).to(1)
    end

    scenario 'they are taken to page where they can see new power' do
      hero = create(:hero)
      create_list(:stopped_crime, 3, :hero => hero)
      power = create(:power, :cost => 2)
      allow_any_instance_of(
        ApplicationController
      ).to receive(:current_hero).and_return(hero)

      visit power_path(power)
      click_link 'Purchase power'

      within(".most_recent_power") do
        expect(page).to have_link(power.name)
      end
    end
  end
end
