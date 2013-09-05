class TeamUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:phone_number, :name,:avatar, :avatar_cache, :remove_avatar,:high,:weight,:school,:department,:provider, :uid
  # attr_accessible :title, :body
  validates_presence_of :name,:email,:password
  devise :omniauthable, :omniauth_providers => [:facebook]
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = TeamUser.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = TeamUser.create(name:auth.extra.raw_info.name,
                         provider:auth.provider,
                         uid:auth.uid,
                         email:auth.info.email,
                         password:Devise.friendly_token[0,20]
                         )
    end
      user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
