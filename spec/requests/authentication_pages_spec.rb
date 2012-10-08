require 'spec_helper'

describe "AuthenticationPages" do
  subject { page }
  describe " signin page" do
    before { visit signin_path }
    it { should have_selector('title', text: full_title('Sign in')) }
    it { should have_selector('h1', text: 'Sign in') }
    it { should have_link( 'Sign up now!', href: signup_path ) }
    
    describe " with invalid information" do
      before { click_button 'Sign in' }
      it { should have_selector('title', text: 'Sign in') }
#      it { should have_selector('div.alert.alert-error', text: 'Invalid') }
      it { should have_error_message('Invalid') }
      it { should_not have_link('Sign out', href: signout_path) }
      describe " after visit another page" do
        before { click_link 'Home' }
#        it { should_not have_selector('div.alert.alert-error', text: 'Invalid') }
        it { should_not have_error_message('Invalid') }
        it { should_not have_link('Sign out', href: signout_path) }
      end
    end
    describe " with valid information" do
      let(:user) { FactoryGirl.create(:user) }
#        before do
#        fill_in "Username", with: user.username
#        fill_in "Password", with: user.password
#        click_button "Sign in"
#      end
      before { valid_signin(user) }

      it { should have_selector('title', text: full_title(user.name)) }
      it { should have_link('Profile', href: user_path(user)) }
      it { should have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
      describe " followed signout" do
        before { click_link "Sign out" }
        it { should have_link("Sign in", href: signin_path) }
      end
    end
  end
end
