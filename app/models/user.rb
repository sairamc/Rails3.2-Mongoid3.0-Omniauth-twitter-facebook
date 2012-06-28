class User
  include Mongoid::Document
  field :provider, :type => String
  field :uid, :type => String
  field :name, :type => String
  field :email, :type => String
  field :image_url, :type => String
  attr_accessible :provider, :uid, :name, :email, :image_url

  validates_uniqueness_of :uid, :message => "Something went wrong on our side. Try with a different account!"

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
         user.image_url = auth['info']['image'] || ""
      end
    end
  end

end
