# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string(255)
#

require 'spec_helper'

describe User do

  before do
    @user = User.new( name: "Example User", 
                      email: "user@example.com", 
                      username: "example",
                      password: "123456",
                      password_confirmation: "123456" )
  end

  subject { @user }

  it { should respond_to(:username) }
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:authenticate) }
  it { should be_valid }

  describe "when a field is not present" do
    before { @user.username = "" }
    it { should_not be_valid }
    before { @user.name = "" }
    it { should_not be_valid }
    before { @user.email = "" }
    it { should_not be_valid }
  end
  describe "when a field has wrong length" do
    before { @user.username = "a" * 17 }
    it { should_not be_valid }
    before { @user.username = "a" * 5 }
    it { should_not be_valid }
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
    before { @user.email = "a" * 256 }
    it { should_not be_valid }
    before { @user.password = "a" * 5 }
    it { should be_invalid }
    before { @user.password = "a" * 65 }
    it { should be_invalid }
  end
  describe "when an attribute is already taken" do
    before do
      user_with_same_username = @user.dup
      user_with_same_username.username = @user.username.downcase
      user_with_same_username.save
    end
    it { should_not be_valid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_username(@user.username) }
    describe " with valid password" do
      it { should == found_user.authenticate(@user.password) }
    end
    describe " with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }
      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end
end
