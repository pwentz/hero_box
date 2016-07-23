require 'rails_helper'
#As a hero,
#when I sign-in,
#and I type an 'admin' path into url
#and I hit enter
#I expect to see a message saying I don't have authorization

describe 'Hero cannot visit admin routes', :type => :feature do
  scenario 'they try to see a route not present on hero controller' do
    hero, unassociated_hero = create_list(:hero, 2)
    allow_any_instance_of(
      ApplicationController
    ).to receive(:current_hero).and_return(hero)

    visit admin_hero_path(unassociated_hero)

    within('.dialog') do
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end

  scenario 'they try to see a route namespaced w/ admin' do
    hero = create(:hero)
    power = create(:power)
    allow_any_instance_of(
      ApplicationController
    ).to receive(:current_hero).and_return(hero)

    visit admin_power_path(power)

    within('.dialog') do
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
