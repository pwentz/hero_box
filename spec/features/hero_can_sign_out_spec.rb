require 'rails_helper'
#As a hero,
#when I click the logout button
#and I am already logged in
#I expect to not see my dashboard
#and instead see a page confirming my status
describe 'Hero can sign out' do
  scenario 'they click the log out button, and no longer see dashboard' do
    hero = create(:hero)
    stopped_crime = create(:stopped_crime, :hero => hero)

    visit login_path
    fill_in "session[name]", with: hero.name
    fill_in "session[password]", with: hero.password
    click_button 'login'

    click_link 'logout'

    expect(page).not_to have_css("#stopped_crimes_list")
  end
  scenario 'they see a page confirming their status' do
    hero = create(:hero)
    stopped_crime = create(:stopped_crime, :hero => hero)

    visit login_path
    fill_in "session[name]", with: hero.name
    fill_in "session[password]", with: hero.password
    click_button 'login'

    click_link 'logout'

    expect(page.find(".flash_success")).to have_content('Successfully logged out!')
    expect(page).to have_link('login')
  end
end
