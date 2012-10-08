require 'spec_helper'
include SessionsHelper
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

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }
    it { should have_selector('title', text: user.name) }
    it { should have_selector('h1', text: user.name) }
  end
  describe " signup" do
    before { visit signup_path }
    let(:submit) { "Create my account" }
    
    describe " with invalid information" do
      it " should not create an user" do
        expect { click_button submit }.not_to change(User, :count)
      end
      describe " after submission" do
        before { click_button submit }

        it { should have_selector('title', text: full_title('Sign up')) }
        it { should have_content('error') }
      end
    end
    describe " with valid information" do
#      before do
#        fill_in "Username", with: "example"
#        fill_in "Name", with: "Example User"
#        fill_in "Email", with: "user@example.com"
#        fill_in "Password", with: "123456"
#        fill_in "Confirmation password", with: "123456"
#      end
      before { valid_signup }
      it " should create an user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
      describe " after saving an user" do
        before { click_button submit }
        let(:user) { User.find_by_username('example') }

        it { should have_selector('title', text: user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end
    end
  end
end
