require 'rails_helper'

describe 'Admin can view all stopped crimes', :type => :feature do
  scenario 'they can see any crimes' do
    admin = create(:hero, :role => 1)
    stopped_crime_one,
      stopped_crime_two,
        stopped_crime_three = create_list(:stopped_crime, 3)

    allow_any_instance_of(
      ApplicationController
    ).to receive(:current_hero).and_return(admin)

    visit admin_stopped_crimes_path

    within("#crimes_list") do
      expect(page).to have_link(stopped_crime_one.crime)
      expect(page).to have_link(stopped_crime_two.crime)
      expect(page).to have_link(stopped_crime_three.crime)
    end
  end
end
