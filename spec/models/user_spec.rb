# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  session_token   :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }

  subject(:user) { User.new(username: "Jack", password: "cheddar") }

  it "ensures session token" do
    expect(user.session_token).not_to be_nil
  end
  it "resets session token" do
    orig_session_token = user.session_token
    user.reset_session_token
    expect(user.session_token).not_to eq(orig_session_token)
  end

  it "checks the supplied password is valid" do
    expect(user.is_password?("cheddar")).to be_truthy
    expect(user.is_password?("gouda")).to be_falsy
  end

  it "assigns a password digest" do
    expect(user.password_digest).not_to be_nil
  end

  it "finds by credentials" do
    user.save!
    expect(User.find_by_credentials("Jack","cheddar")).to eq(user)
  end

end
