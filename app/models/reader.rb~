class Reader < ActiveRecord::Base
  has_many :reviews;
  attr_protected :uid, :provider, :name # see text for explanation
  def self.create_with_omniauth(auth)
    Reader.create!(
      :provider => auth["provider"],
      :uid => auth["uid"],
      :name => auth["info"]["name"])
  end
end
