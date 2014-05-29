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

  private
  def parse_path_for_attributes
    @extension = File.extname(@path)
    @filename = File.basename(@path, @extension)
  end
end
