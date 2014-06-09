require 'digest/md5'
require 'dropbox_sdk'

class User < ActiveRecord::Base
  has_and_belongs_to_many :projects
  has_secure_password
  has_many :comments
  has_many :owned_projects, foreign_key: "owner_id", class_name: "Project"
  has_many :invites
  has_many :notifications
  validates :email, :username, presence: true
  validates :username, format: /[a-z0-9\-_]+/

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

  def github
    if @github_client.nil?
      @github_client = Octokit.new access_token: dropbox_token
    else
      @github_client
    end
  end

  def has_invite_to_project? project
    invites.pending.each do |invite|
      return true if invite.project == project
    end

    return false
  end
end
