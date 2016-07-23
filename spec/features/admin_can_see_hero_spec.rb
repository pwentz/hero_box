require 'rails_helper'

describe 'Admin can see hero page', :type => :feature do
  scenario 'they can see hero information' do
    admin = create(:hero, :role => 1)
    hero = create(:hero)
    stopped_crime = create(:stopped_crime, :hero => hero)
    allow_any_instance_of(
      ApplicationController
    ).to receive(:current_hero).and_return(admin)

    visit admin_hero_path(hero)

    within("#hero_stats") do
      expect(page).to have_text(hero.name)
    end

    expect(page.find(".avatar")).to have_css("img[src=\"#{hero.image_url}\"]")
  end
  scenario 'they can find links to stopped crimes by hero' do
    admin = create(:hero, :role => 1)
    hero = create(:hero)
    stopped_crime = create(:stopped_crime, :hero => hero)
    allow_any_instance_of(
      ApplicationController
    ).to receive(:current_hero).and_return(admin)

    visit admin_hero_path(hero)

    within("#crime_stats") do
      expect(page).to have_link(stopped_crime.crime)
    end
  end
end
