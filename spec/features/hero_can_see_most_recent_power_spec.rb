require 'rails_helper'
#As a hero,
#when I visit my dashboard,
#I expect to see the last power I purchased
#and when I purchase a new power
#I expect to see that new power in the last power's place

describe 'Hero can see most recent power', :type => :feature do
  scenario 'they can see the last power they had purchased' do
    hero = create(:hero)
    power = create(:power, :image_url => Faker::Placeholdit.image)
    hero.powers << power
    allow_any_instance_of(
      ApplicationController
    ).to receive(:current_hero).and_return(hero)

    visit root_path

    within("#recent_power") do
      expect(page).to have_css("img[src=\"#{power.image_url}\"]")
    end
  end

  scenario 'when they purchase a new power, their old power gets replaced' do
    hero = create(:hero)
    create(:stopped_crime, :hero => hero)
    power = create(:power, :image_url => Faker::Placeholdit.image)
    new_power = create(:power, :image_url => Faker::Avatar.image, :cost => 0)
    hero.powers << power
    allow_any_instance_of(
      ApplicationController
    ).to receive(:current_hero).and_return(hero)

    visit power_path(new_power)
    click_link 'Purchase power'

    within("#recent_power") do
      expect(page).to have_css("img[src=\"#{new_power.image_url}\"]")
      expect(page).not_to have_css("img[src=\"#{power.image_url}\"]")
    end
  end
end
