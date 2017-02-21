require 'spec_helper'
require 'rails_helper'


feature 'creating goals' do

  before :each do
    visit new_user_path
    sign_up
    visit new_goal_path
  end

  scenario 'has a new goal page' do
    expect(page).to have_content("Create Goal")
  end

  scenario 'goal page takes title, comment, and public or private' do
    expect(page).to have_content("Title")
    expect(page).to have_content("Comment")
    expect(page).to have_content("Public")
    expect(page).to have_content("Private")
  end

  feature 'attempts to creates goal' do
    scenario 'with invalid goal parameters' do
      click_button "Create Goal"
      expect(page).to have_content("Title can't be blank")
    end

    scenario 'with valid goal parameters' do
      fill_in('Title', with: "Do yoga")
      click_button "Create Goal"
      expect(page).to have_content("Jack's Goal")
      expect(current_path).to start_with("/goals/#{Goal.find_by(title: "Do yoga").id}")
    end

  end
end

feature 'showing goals' do
  
end
