require 'rails_helper'

describe "Hero signs in" do
  context "with valid login" do
    scenario "they get redirected to their dashboard" do
      hero = create(:hero)
      visit login_path

      fill_in "session[name]", with: hero.name
      fill_in "session[password]", with: hero.password
      click_button 'login'

      within(".flash_success") do
        expect(page).to have_text("Welcome #{hero.name}")
      end

      within(".login") do
        expect(page).to have_content('logout')
        expect(page).not_to have_content('login')
      end
    end
  end
end
