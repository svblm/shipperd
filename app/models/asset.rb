class Asset < ActiveRecord::Base
  attr_accessor :files, :thumbnail
  belongs_to :project
  has_many :comments
  validates :name, presence: true, uniqueness: true
  enum state: ['staged', 'shipped', 'abandoned']
  before_create :create_asset_folder

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
      asset_file = AssetFile.new file["path"]
      asset_file.asset = self
      if asset_file.filename == "_thumb"
        @thumbnail = asset_file
      else
        @files.push asset_file
      end
    end

    @files
  end

  def thumbnail
    @thumbnail || files
    @thumbnail
  end

  private
  def asset_folder
    "#{project.folder}/#{name.downcase.parameterize}"
  end

  def dropbox
    project.owner.dropbox
  end
end
