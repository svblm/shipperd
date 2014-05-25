class Asset < ActiveRecord::Base
  belongs_to :project
  validates :name, presence: true, uniqueness: true
  enum state: ['staged', 'shipped', 'abandoned']

  validate :create_asset_folder
  def create_asset_folder
    begin
      project.create_folder(name.downcase.parameterize)
    rescue DropboxError => e
      puts e.message
      errors[:base] << "Failed to create asset folder in dropbox"
    end
  end

end
