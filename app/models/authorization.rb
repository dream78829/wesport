class Authorization < ActiveRecord::Base
	attr_accessible :user_id ,:uid,:provider
  PROVIDERS = [:facebook]

  belongs_to :team_user
  validates_presence_of :user_id, :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  def self.create_by_omniauth(hash, current_team_user = nil)
    hash = ActiveSupport::HashWithIndifferentAccess.new hash
    auth = find_from_hash(hash)
    unless auth
      current_team_user ||= TeamUser.create_from_auth!(hash)
      auth = Authorization.new(:user=>current_team_user,:uid=>hash[:uid],:provider=>hash[:provider])
      auth.save
    end
    auth
  end

  private

  def self.find_from_hash(hash)
    if hash[:provider] && hash[:uid]
      find_by_provider_and_uid(hash[:provider],hash[:uid])
    end
  end
end