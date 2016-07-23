require 'rails_helper'

#As an admin
#when I visit an individual power's page
#and I click 'Edit this power' link
#and I fill in the appropriate forms
#I expect to be taken to that power's page
#and I expect to see that power's updated information

describe 'Admin can edit existing powers' do
  scenario 'they visit edit page from power show page' do
    admin = create(:hero, :role => 1)
    power = create(:power)
    allow_any_instance_of(
      ApplicationController
    ).to receive(:current_hero).and_return(admin)

    visit admin_power_path(power)

    click_link 'Edit this power'

    expect(current_path).to eq(edit_admin_power_path(power))
  end

  scenario 'they can see updated information' do
    admin = create(:hero, :role => 1)
    power = create(:power)
    power_name = Faker::Superhero.power
    allow_any_instance_of(
      ApplicationController
    ).to receive(:current_hero).and_return(admin)

    visit edit_admin_power_path(power)

    fill_in "power[name]", with: power_name
    click_button 'Update Power'

    expect(
      page.find("#power_name")
    ).to have_content(power_name)
  end
end
