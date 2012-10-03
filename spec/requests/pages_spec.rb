require 'spec_helper'

describe "Pages" do
  subject {page}
  describe "GET /pages" do
    it "Check response" do
      get root_path

      response.status.should be(200)
    end
  end

  describe "Home page" do
    before { visit root_path }
   
    it { should have_selector('title', text: full_title('') ) }
    it { should have_selector('title', text: '| Home') }
  end
  describe "Help page" do
    before { visit help_path }

    it { should have_selector('title', text: full_title('Help')) }
  end
  describe "About page" do
    before { visit about_path }

    it { should have_selector('title', text: full_title('About')) }
  end
  describe "Contact page" do
    before { visit contact_path }
    it { should have_selector('title', text: full_title('Contact')) }
  end
end
