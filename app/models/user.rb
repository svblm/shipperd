require 'digest/md5'

class User < ActiveRecord::Base
  has_and_belongs_to_many :projects
  has_secure_password
  validates :email, :username, presence: true

  def gravatar_url(size)
    "http://gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}/?s=#{size}&d=retro"
  end
end
