class TeamUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :name,:email,:password
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:phone_number, :name,:avatar, :avatar_cache, :remove_avatar,:high,:weight,:school,:department
  # attr_accessible :title, :body

  attr_accessible :current_password
  attr_accessor :current_password

  def update_with_password(params={}) 
    if params[:password].blank? 
      params.delete(:password)
      params.delete(:current_password) 
      params.delete(:password_confirmation) if params[:password_confirmation].blank? 
    end 
    super(params)
    update_attributes(params) 
  end
end
