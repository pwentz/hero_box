require 'rails_helper'

describe "Hero can see their stopped crimes", :type => :feature do
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
