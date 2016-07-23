require 'rails_helper'

#As a hero,
#when I visit the powers page
#and I click on any power's name
#I expect to see a page with ONLY that power's information

describe 'Hero can see individual power', :type => :feature do
  scenario 'they are taken to power page after clicking on power' do
    hero = create(:hero)
    existing_power = create(:power)
    allow_any_instance_of(
      ApplicationController
    ).to receive(:current_hero).and_return(hero)
    
    visit powers_path

    click_link(existing_power.name)

    expect(current_path).to eq(power_path(existing_power))
  end
  scenario "they can see that ONLY power's information" do
    hero = create(:hero)
    existing_power = create(:power)
    allow_any_instance_of(
      ApplicationController
    ).to receive(:current_hero).and_return(hero)

    visit power_path(existing_power)

    expect(page.find("#power_name")).to have_text(existing_power.name)
    expect(page).not_to have_link('Edit this power')
    expect(page).not_to have_link('Destroy this power')
  end
end
