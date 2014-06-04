class AssetFile
  attr_accessor :path, :filename, :extension, :asset

  IMAGE_TYPES = [
    ".png",
    ".gif",
    ".jpeg",
    ".jpg",
    ".svg"
  ]

  SCRIPT_TYPES = [
    ".cs"
  ]

  MODEL_TYPES = [
    ".fbx",
    ".collada",
    ".dae"
  ]

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

  def is_image_file?
    [
      ".png",
      ".gif",
      ".jpeg",
      ".jpg",
      ".svg"
    ].include? extension
  end

  def type
    'image' if IMAGE_TYPES.include? extension
    'model' if MODEL_TYPES.include? extension
    'script' if SCRIPT_TYPES.include? extension
  end

  def metadata
    {
      height: "100px",
      width: "100px"
    }
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
