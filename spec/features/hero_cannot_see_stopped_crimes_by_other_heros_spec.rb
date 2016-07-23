require 'rails_helper'
#As a hero,
#when I login,
#and I visit my dashboard
#and I change the :hero_id in the dashboard to (:hero_id - 1)
#I expect to see an error page
#and I expect to see a message saying I lack authorization

describe 'Hero cannot see stopped crimes by other heros', :type => :feature do
  context "they try to see other hero's crime dashboard" do
    scenario 'they are met with an error page and a descriptive message' do
      hero = create(:hero)
      unassociated_hero = create(:hero)
      allow_any_instance_of(
        ApplicationController
      ).to receive(:current_hero).and_return(hero)

      visit hero_stopped_crimes_path(unassociated_hero)

      within('.dialog') do
        expect(page).to have_content("The page you were looking for doesn't exist")
      end
    end
  end

  context "they try to see other hero's specific crimes" do
    scenario 'they are met with error page and message' do
      hero = create(:hero)
      unassociated_hero = create(:hero)
      stopped_crime = create(:stopped_crime, :hero => unassociated_hero)
      allow_any_instance_of(
        ApplicationController
      ).to receive(:current_hero).and_return(hero)

      visit hero_stopped_crime_path(unassociated_hero, stopped_crime)

      within('.dialog') do
        expect(page).to have_content("The page you were looking for doesn't exist")
      end
    end
  end
end
