require 'rails_helper'

describe 'Admin can create a hero' do
  scenario 'they create hero and redirected to hero index' do
    admin = create(:hero, :role => 1)
    stopped_crime = create(:stopped_crime)
    hero_name = Faker::Superhero.name
    hero_hometown = Faker::Address.city
    allow_any_instance_of(
      ApplicationController
    ).to receive(:current_hero).and_return(admin)

    visit admin_heros_path(admin)
    click_link 'Create new hero', new_admin_hero_path(admin)

    within(".new_hero") do
      fill_in 'hero[name]', with: hero_name
      fill_in 'hero[hometown]', with: hero_hometown
      fill_in 'hero[password]', with: 'password'
      page.check("stopped_crime_#{stopped_crime.id}")
      click_button 'Create Hero'
    end

    within("#heroes_list") do
      expect(page).to have_link(hero_name)
    end
  end
end
