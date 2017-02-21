require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET#new" do
    it "renders new user page" do
      get :new
      expect(response).to render_template(:new)
    end
  end


  describe "POST#create" do
    it "creates a user when given valid credentials and redirects to user page"  do
      post :create, user: { username: "Jack", password: "cheddar" }
      expect(response).to redirect_to(user_url(User.find_by(username: "Jack")))
    end

    it "renders new with error message when given invalid credentials" do
      post :create, user: { username: "Jack", password: "cat" }
      expect(response).to render_template(:new)
      expect(flash[:errors]).to include("Password is too short (minimum is 6 characters)")
    end
  end

  describe "GET#show" do
    it "renders user page" do
      user = FactoryGirl.create(:user)
      get :show, { id: user.id }
      expect(response).to render_template(:show)
    end
  end
end
