require 'rails_helper'

describe 'Hero can create account', :type => :feature do
  scenario 'they can see create account button when not signed in' do
    visit powers_path

    within("#profile_thumbnail") do
      expect(page).to have_link('Create new account')
    end
  end

  scenario 'they can click create account button and are taken to form' do
    visit powers_path

    click_link 'Create new account'

    expect(page).to have_css(".new_hero")
  end

  scenario 'they fill in form and hero is created' do
    visit new_hero_path

    within(".new_hero") do
      fill_in 'hero[name]', with: 'Bill'
      fill_in 'hero[password]', with: 'password'
      expect{
        click_button 'Create Hero'
      }.to change{Hero.count}.from(0).to(1)
    end
  end

  scenario 'they create hero and get taken to login' do
    visit new_hero_path
    within(".new_hero") do
      fill_in 'hero[name]', with: 'Bill'
      fill_in 'hero[password]', with: 'password'
      click_button 'Create Hero'
    end

    expect(current_path).to eq(login_path)
  end
end
