class Project < ActiveRecord::Base
  has_many :assets
  has_and_belongs_to_many :users
  belongs_to :owner, class_name: "User"
  validates :name, :description, presence: true
  validates :homepage, format: /https?:\/\/[\S]+/i, allow_nil: true
  def create_folder(folder_name)
    owner.dropbox.file_create_folder("#{name.downcase.parameterize}/#{folder_name}")
  end

  validate :create_project_folder
  def create_project_folder
    begin
      owner.dropbox.file_create_folder(name.downcase.parameterize) unless Rails.env.test?
    rescue DropboxError => e
      puts e.message
      errors[:base] << "Failed to create dropbox folder."
    end
  end

  def has_member?(user)
    owner == user or users.include? user
  end

  def folder
    name.downcase.parameterize
  end
end
