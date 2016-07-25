require 'rails_helper'

describe "Admin can see all heroes" do
  scenario "they can visit the heros index from their dashboard" do
    admin = create(:hero, :role => 1)
    hero_one, hero_two, hero_three = create_list(:hero, 3)
    allow_any_instance_of(
      ApplicationController
    ).to receive(:current_hero).and_return(admin)

    visit admin_heros_path(admin)

    within("#all_heroes") do
      expect(page).to have_link(hero_one.name)
      expect(page).to have_link(hero_two.name)
      expect(page).to have_link(hero_three.name)
    end
  end
end
