require 'rails_helper'

describe 'Admin can view individual stopped crime', :type => :feature do
  scenario 'they can see crime details and related hero' do
    admin = create(:hero, :role => 1)
    stopped_crime_one,
      stopped_crime_two = create_list(:stopped_crime, 2)

    allow_any_instance_of(
      ApplicationController
    ).to receive(:current_hero).and_return(admin)

    visit admin_stopped_crime_path(stopped_crime_one)

    within("#crime_details") do
      expect(page).to have_text(stopped_crime_one.criminal)
      expect(page).to have_text(stopped_crime_one.potential_victim)
      expect(page).to have_link(stopped_crime_one.hero.name)
    end
  end
end
