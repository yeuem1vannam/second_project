require 'spec_helper'

describe "Pages" do
  subject {page}
  describe "GET /pages" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get root_path
      response.status.should be(200)
    end
  end

  describe "Home page" do
    before { visit root_path }
   
    it { should have_selector('title', text: full_title('') ) }
    it { should have_selector('title', text: '| Home') }
  end
end
