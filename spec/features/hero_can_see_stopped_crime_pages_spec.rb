require 'rails_helper'

describe "Hero can see individual crime pages" do
  scenario "they see the crime details" do
    hero = create(:hero)
    stopped_crime = create(:stopped_crime, :hero => hero)

    allow_any_instance_of(
      ApplicationController
    ).to receive(:current_hero).and_return(hero)

    visit hero_stopped_crimes_path(hero)

    click_link stopped_crime.crime

    expect(current_path).to eq(hero_stopped_crime_path(hero, stopped_crime))

    within("#crime_details") do
      expect(page).to have_text(stopped_crime.criminal)
      expect(page).to have_text(stopped_crime.potential_victim)
      expect(page).to have_text(stopped_crime.location)
    end
  end
end
