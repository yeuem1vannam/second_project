module UsersHelper
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  
  def signed_in?
    return false
  end
  def avatar_for(user, options = { size: 50 })
    avatar_id = ""
    avatar_url = ""
    image_tag(avatar_url, alt: user.name, class:"avatar")
    size = options[:size]
  end
#  # Returns the Gravatar (http://gravatar.com/) for the given user.
#  def gravatar_for(user)
#    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
#    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
#    image_tag(gravatar_url, alt: user.name, class: "gravatar")
#  end
end
