require 'redcarpet'
class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :asset
  validates :body, presence: true
  validates :user, :asset, associated: true
  before_save :convert_to_html, :set_revision_number

  def convert_to_html
    markdown = Redcarpet::Markdown.new Redcarpet::Render::HTML.new(hard_wrap: true), autolink: true, underline: true, fenced_code_blocks: true, disable_indented_code_blocks: true, no_intra_emphasis: true
    self.body = markdown.render(self.body)
  end

  def set_revision_number
    self.revision = asset.revision
  end

  def out_of_date?
    self.revision < asset.revision
  end
end
