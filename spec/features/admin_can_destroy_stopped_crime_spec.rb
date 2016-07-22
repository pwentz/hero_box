require 'rails_helper' 

describe 'Admin can destroy stopped crime record' do
  scenario 'they destroy record permanently' do
    admin = create(:hero, :role => 1)
    stopped_crime_one,
      stopped_crime_two = create_list(:stopped_crime, 2)

    allow_any_instance_of(
      ApplicationController
    ).to receive(:current_hero).and_return(admin)

    visit admin_stopped_crime_path(stopped_crime_one)

    click_link 'Destroy this record'

    expect(current_path).to eq(admin_stopped_crimes_path)
    within("#crimes_list") do
      expect(page).to have_link(stopped_crime_two.crime)
      expect(page).not_to have_link(stopped_crime_one.crime)
    end
  end
end
