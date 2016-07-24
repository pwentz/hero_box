require 'rails_helper'

describe "Admin can create and assign stopped crimes" do
  context 'with valid credentials' do
    scenario "they are taken to the page of the hero they assigned" do
      admin = create(:hero, :role => 1)
      crime_name = Faker::Hacker.ingverb
      criminal_name = Faker::Book.author
      victim_name = Faker::Name.name
      crime_location = Faker::Address.city
      allow_any_instance_of(
        ApplicationController
      ).to receive(:current_hero).and_return(admin)
      hero_one, hero_two = create_list(:hero, 2)

      visit new_admin_stopped_crime_path

      within(".new_stopped_crime") do
        fill_in "stopped_crime[crime]", with: crime_name
        fill_in "stopped_crime[potential_victim]", with: victim_name
        fill_in "stopped_crime[criminal]", with: criminal_name
        fill_in "stopped_crime[location]", with: crime_location
        page.check("hero_#{hero_two.id}")
        click_button 'Create stopped crime record'
      end

      within("#crimes_list") do
        expect(page).to have_link(crime_name)
      end
    end
  end

  context 'with invalid credentials' do
    scenario 'they see an error message and stay on page' do
      admin = create(:hero, :role => 1)
      allow_any_instance_of(
        ApplicationController
      ).to receive(:current_hero).and_return(admin)
      
      visit new_admin_stopped_crime_path

      within(".new_stopped_crime") do
        click_button 'Create stopped crime record'
      end

      expect(page).to have_css(".new_stopped_crime")
      within(".new_stopped_crime") do
        expect(page).to have_content("Crime can't be blank")
        expect(page).to have_content("Potential victim can't be blank")
        expect(page).to have_content("Location can't be blank")
      end
    end
  end
end
