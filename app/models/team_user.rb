class TeamUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :account, :team_contact_phone_number, :team_contact_email, :team_name,:avatar, :avatar_cache, :remove_avatar
  # attr_accessible :title, :body
   validates_presence_of  :avatar
  validates_integrity_of  :avatar
  validates_processing_of :avatar

end
