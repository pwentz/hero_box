require 'rails_helper'
#As a user
#when I visit my dashboard
#and I'm signed in,
#and I have existing stopped crimes,
#I expect to see links to my stopped crimes

describe "Hero can see their stopped crimes", :type => :feature do
  context 'they are signed in' do
    scenario "they see a list of their crimes, with links to pages" do
      hero = create(:hero)
      stopped_crime_one, 
      stopped_crime_two = create_list(:stopped_crime, 2, :hero => hero)
      stopped_crime_three = create(:stopped_crime)

      allow_any_instance_of(
        ApplicationController
      ).to receive(:current_hero).and_return(hero)

      visit hero_stopped_crimes_path(hero)

      within("#stopped_crimes_list") do
        expect(page).to have_link(stopped_crime_one.crime)
        expect(page).to have_link(stopped_crime_two.crime)
        expect(page).not_to have_link(stopped_crime_three.crime)
      end
    end
  end

  context 'they are NOT signed in' do
    scenario 'they are met with a friendly reminder and redirected to login' do
      hero = create(:hero)

      visit hero_stopped_crimes_path(hero)

      within('.dialog') do
        expect(
          page
        ).to have_content('You must login first to participate in Hero Box!')
      end
    end
  end
end
