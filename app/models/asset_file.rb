class AssetFile
  attr_accessor :path, :filename, :extension, :asset

  def initialize path
    @path = path
  end

  def filename
    @filename || parse_path_for_attributes
    @filename
  end

  def extension
    @extension || parse_path_for_attributes
    @extension
  end

  def display_image_path
    if is_image_file?
      media_path = dropbox.media path
      media_path["url"]
    else
      nil # parse for nice placeholder image
    end
  end

  private
  def parse_path_for_attributes
    @extension = File.extname(@path)
    @filename = File.basename(@path, @extension)
  end

  def dropbox
    asset.project.owner.dropbox
  end
end
