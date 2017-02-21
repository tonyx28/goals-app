require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  before :each do
    visit new_user_path
  end

  scenario "has a new user page" do
    expect(page).to have_content 'Sign Up'
  end

  scenario "takes a username and password" do
    expect(page).to have_content 'Username'
    expect(page).to have_content 'Password'
  end

  feature "signing up a user" do

    scenario "shows username on the homepage after signup" do
      sign_up
      expect(page).to have_content 'Jack'
      expect(current_path).to eq("/users/1")
    end

  end

end

feature "logging in" do

  before { FactoryGirl.create(:user, username: "Jill") }

  before :each do
    visit new_session_path
  end

  scenario "has a user login page" do
    expect(page).to have_content 'Sign In'
  end

  scenario "takes a username and password" do
    expect(page).to have_content 'Username'
    expect(page).to have_content 'Password'
  end

  feature "signing in a user" do

    scenario "shows username on the homepage after login" do
      sign_in("Jill")
      expect(page).to have_content 'Jill'
      expect(current_path).to eq("/users/#{User.find_by(username: 'Jill').id}")
    end

  end

end

feature "logging out" do

  before { FactoryGirl.create(:user, username: "Jill") }

  before :each do
    visit new_session_path
    sign_in("Jill")
    logout
  end

  scenario "begins with a logged out state" do
    expect(page).to have_selector(:link_or_button, 'Sign In')
    expect(page).to have_selector(:link_or_button, 'Sign Up')
  end

  scenario "doesn't show username on the homepage after logout" do
    expect(page).not_to have_content 'Jill'
  end

end
