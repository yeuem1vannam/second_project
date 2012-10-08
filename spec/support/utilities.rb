include ApplicationHelper
require 'spec_helper'
def valid_signin(user)
  fill_in "Username", with: user.username
  fill_in "Password", with: user.password
  click_button "Sign in"
end
def valid_signup
  fill_in "Username", with: "example"
  fill_in "Name"    , with: "Example User"
  fill_in "Email"   , with: "user@example.com"
  fill_in "Password", with: "123456"
  fill_in "Confirmation password", with: "123456"
end
RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-error', text: message)
  end
end
