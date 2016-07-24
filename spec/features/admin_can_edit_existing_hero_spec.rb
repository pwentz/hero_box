require 'rails_helper'

#As an admin
#when I visit an individual hero's page
#and I click the 'Edit this hero' button
#and I fill in valid information
#I expect to be taken to that hero's page,
#and I expect to see updated hero information

describe 'Admin can edit a hero', :type => :feature do
  context 'with valid credentials' do
    scenario 'they visit edit page from hero show page' do
      admin = create(:hero, :role => 1)
      existing_hero = create(:hero)
      allow_any_instance_of(
        ApplicationController
      ).to receive(:current_hero).and_return(admin)

      visit admin_hero_path(existing_hero)

      expect(page).to have_link('Edit this hero')
    end
    
    scenario 'they see updated information after filling out form' do
      admin = create(:hero, :role => 1)
      existing_hero = create(:hero)
      former_stopped_crime = create(:stopped_crime, :hero => existing_hero)
      new_stopped_crime = create(:stopped_crime)
      updated_hero_name = Faker::Superhero.name
      allow_any_instance_of(
        ApplicationController
      ).to receive(:current_hero).and_return(admin)

      visit edit_admin_hero_path(existing_hero)

      within(".edit_hero") do
        fill_in "hero[name]", with: updated_hero_name
        page.uncheck("stopped_crime_#{former_stopped_crime.id}")
        page.check("stopped_crime_#{new_stopped_crime.id}")
        click_button 'Update Hero'
      end

      within("#hero_stats") do
        expect(page).to have_text(updated_hero_name)
      end

      within("#crime_stats") do
        expect(page).to have_link(new_stopped_crime.crime)
        expect(page).not_to have_link(former_stopped_crime.crime)
      end
    end
  end
end
