require 'digest/md5'
require 'dropbox_sdk'

class User < ActiveRecord::Base
  has_and_belongs_to_many :projects
  has_secure_password
  has_many :owned_projects, foreign_key: "owner_id", class_name: "Project"
  validates :email, :username, presence: true

  def gravatar_url(size)
    "http://gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}/?s=#{size}&d=retro"
  end

  def has_linked_dropbox?
    dropbox_token.present?
  end

  def dropbox
    if @dropbox_client.nil?
      @dropbox_client = DropboxClient.new(dropbox_token)
    else
      @dropbox_client
    end
  end
end
