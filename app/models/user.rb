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
class User < ActiveRecord::Base
include UsersHelper
  attr_accessible :email, :name, :username, :password, :password_confirmation

  has_secure_password
  before_save { self.username.downcase! }

  validates( :name, presence: true, length: { maximum: 50 })
  validates( :username, presence: true, length: { maximum: 16, minimum: 6 },
              uniqueness: { case_sensitive: false } )
  validates( :email, presence: true, length: { maximum: 255 }, 
              format: { with: VALID_EMAIL_REGEX } ) # VALID_EMAIL_REGEX < UsersHelper
  validates :password, presence: true, length: { minimum: 6, maximum: 64 }
  validates :password_confirmation, presence: true
end
