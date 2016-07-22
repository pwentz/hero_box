require 'rails_helper'

describe "Admin can create and assign stopped crimes" do
  scenario "they are taken to the page of the hero they assigned" do
    admin = create(:hero, :role => 1)
    hero_one, hero_two = create_list(:hero, 2)
    victim_name = Faker::Name.name

    visit admin_heros_path(admin)
    click_link "Record stopped crime"

    fill_in "stopped_crime[potential_victim]", with: victim_name
  end
end
