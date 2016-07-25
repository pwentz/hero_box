require 'rails_helper'
# As an admin,
# # when I create a hero
# and I fill in the correct forms
# and I click submit
# I should find my new hero on the hero index
# with any other existing heros

describe 'Admin can create a hero', :type => :feature do
  context 'with valid credentials and default image' do
    scenario 'they create hero and redirected to hero index' do
      admin = create(:hero, :role => 1)
      existing_hero = create(:hero)
      stopped_crime = create(:stopped_crime)
      hero_image = Faker::Avatar.image
      allow_any_instance_of(
        ApplicationController
      ).to receive(:current_hero).and_return(admin)

      visit admin_heros_path(admin)
      click_link 'Create new hero', new_admin_hero_path(admin)

      within(".new_hero") do
        fill_in 'hero[name]', with: 'Bill'
        fill_in 'hero[hometown]', with: 'Pallet Town'
        fill_in 'hero[password]', with: 'password'
        page.check("stopped_crime_#{stopped_crime.id}")
        fill_in 'hero[image_url]', with: hero_image
        click_button 'Create Hero'
      end

      within("#all_heroes") do
        expect(page).to have_link(existing_hero.name)
        expect(page).to have_link('Bill')
      end
    end
  end

  context 'with valid credentials and NO image' do
    scenario 'they create a hero with a robot default image' do
      admin = create(:hero, :role => 1)
      allow_any_instance_of(
        ApplicationController
      ).to receive(:current_hero).and_return(admin)

      visit new_admin_hero_path

      within(".new_hero") do
        fill_in 'hero[name]', with: 'Bill'
        fill_in 'hero[hometown]', with: 'Pallet Town'
        fill_in 'hero[password]', with: 'password'
        click_button 'Create Hero'
      end

      within("#all_heroes") do
        expect(page).to have_css("img[src=\"#{Hero.last.image_url}\"]")
      end
    end
  end

  context 'with invalid credentials' do
    scenario 'they see an error message' do
      admin = create(:hero, :role => 1)
      hero_image = Faker::Avatar.image
      allow_any_instance_of(
        ApplicationController
      ).to receive(:current_hero).and_return(admin)

      visit new_admin_hero_path

      within(".new_hero") do
        click_button 'Create Hero'
      end

      expect(page).to have_css(".new_hero")
      within(".new_hero") do
        expect(page).to have_content("Name can't be blank")
        expect(page).to have_content("Password can't be blank")
      end
    end
  end
end
