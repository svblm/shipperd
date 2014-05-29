class Asset < ActiveRecord::Base
  attr_accessor :files
  belongs_to :project
  validates :name, presence: true, uniqueness: true
  enum state: ['staged', 'shipped', 'abandoned']

  validate :create_asset_folder
  def create_asset_folder
    begin
      project.create_folder(name.downcase.parameterize) unless Rails.env.test?
    rescue DropboxError => e
      puts e.message
      errors[:base] << "Failed to create asset folder in dropbox"
    end
  end

  def files
    return @files unless @files.nil?

    @files = []
    metadata = dropbox.metadata asset_folder, 1000, true

    metadata["contents"].each do |file|
      @files.push AssetFile.new file["path"]
    end

    @files
  end

  private
  def asset_folder
    "#{project.folder}/#{name.downcase.parameterize}"
  end

  def dropbox
    project.owner.dropbox
  end
end
