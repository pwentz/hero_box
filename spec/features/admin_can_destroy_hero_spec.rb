require 'rails_helper'

describe 'Admin can destroy a hero', :type => :feature do
  scenario 'they can destroy a hero from hero show page' do
    admin = create(:hero, :role => 1)
    hero = create(:hero)
    allow_any_instance_of(
      ApplicationController
    ).to receive(:current_hero).and_return(admin)

    visit admin_hero_path(hero)

    click_link 'Destroy this hero'

    expect(current_path).to eq(admin_heros_path(admin))
    within("#all_heroes") do
      expect(page).not_to have_link(hero.name)
    end
  end
end

