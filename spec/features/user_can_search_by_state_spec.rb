require 'rails_helper'

# As a user
# When I visit "/"
# And I select "Colorado" from the dropdown
# And I click on "Locate Members of the House"
# Then my path should be "/search" with "state=CO" in the parameters
# And I should see a message "7 Results"
# And I should see a list of the 7 members of the house for Colorado
# And I should see a name, role, party, and district for each member

feature 'user submits valid state name' do
  scenario 'user submits valid state name' do
    visit '/'

    select 'Colorado', from: :state
    click_on 'Locate Members of the House'

    expect(current_path).to eq(search_path)

    expect(page).to have_content('8 Results')
    expect(page).to have_css('.member', count: 8)

    within(first('.member')) do
      expect(page).to have_css('.name')
      expect(page).to have_css('.role')
      expect(page).to have_css('.party')
      expect(page).to have_css('.district')
    end
  end
end

