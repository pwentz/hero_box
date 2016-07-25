require 'rails_helper'

#As a hero,
#when I'm logged in
#and I visit the potential powers page
#I expect to see an indicator of some sort,
#and I expect that indicator to tell me the amount of stopped crimes I am away
#from being able to purchase any power

describe 'Hero should be able to see progress left to afford powers' do
  context 'they dont have many crimes' do
    scenario 'they see a red progress bar when lower than 50% away' do
      hero = create(:hero)
      create_list(:stopped_crime, 1, :hero => hero)
      create(:power, :cost => 3)
      allow_any_instance_of(
        ApplicationController
      ).to receive(:current_hero).and_return(hero)

      visit powers_path

      within("#distance_to_availability") do
        expect(page).to have_css(".progress.progress-danger")
      end
    end
  end

  context 'they are close to affording power' do
    scenario 'they see a yellow progress bar' do
      hero = create(:hero)
      create_list(:stopped_crime, 2, :hero => hero)
      create(:power, :cost => 3)

      allow_any_instance_of(
        ApplicationController
      ).to receive(:current_hero).and_return(hero)

      visit powers_path

      within("#distance_to_availability") do
        expect(page).to have_css(".progress.progress-warning")
      end
    end

    context 'they can afford power' do
      scenario 'they see a green progress bar' do
        hero = create(:hero)
        create_list(:stopped_crime, 2, :hero => hero)
        create(:power, :cost => 2)

        allow_any_instance_of(
          ApplicationController
        ).to receive(:current_hero).and_return(hero)

        visit powers_path

        within("#distance_to_availability") do
          expect(page).to have_css(".progress.progress-success")
        end
      end
    end
  end
end
