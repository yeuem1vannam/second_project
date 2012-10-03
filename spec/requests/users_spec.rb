require 'spec_helper'

describe "Users" do
  subject { page }
  describe "GET /users" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get signup_path
      response.status.should be(200)
    end
  end
  describe "Sign up page" do
    before { visit signup_path }
    it { should have_selector('title', text: full_title('Sign up')) }
  end
end
