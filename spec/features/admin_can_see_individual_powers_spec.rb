require 'rails_helper'

#As an admin
#when I'm looking at potential powers page
#and I click on an individual power
#I expect to see that power's information on it's own page

describe 'Admin can see individual powers', :type => :feature do
  scenario 'they can visit from potential powers' do
    admin = create(:hero, :role => 1)
    existing_power = create(:power)
    allow_any_instance_of(
      ApplicationController
    ).to receive(:current_hero).and_return(admin)

    visit powers_path
    click_link existing_power.name

    expect(current_path).to eq(admin_power_path(existing_power))
  end

  scenario 'they can see power information on page' do
    admin = create(:hero, :role => 1)
    existing_power = create(:power)
    allow_any_instance_of(
      ApplicationController
    ).to receive(:current_hero).and_return(admin)

    visit admin_power_path(existing_power)

    expect(page.find("#power_name")).to have_content(existing_power.name)
  end
end
