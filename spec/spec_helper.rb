RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  def sign_up
    fill_in "Username", with: "Jack"
    fill_in "Password", with: "cheddar"
    click_button "Sign Up"
  end

  def sign_in(username)
    fill_in "Username", with: username
    fill_in "Password", with: "cheddar"
    click_button "Sign In"
  end

  def logout
    click_button "Sign Out"
  end

end
