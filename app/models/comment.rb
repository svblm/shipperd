require 'redcarpet'
class Comment < ActiveRecord::Base
  belongs_to :commenter, class_name: 'User'
  belongs_to :asset
  validates :body, presence: true
  validates :commenter, :asset, associated: true
  before_save :parse_for_mentions, :convert_to_html, :set_revision_number

  def convert_to_html
    self.body = Comment.markdown(body)
  end

  def self.markdown(text)
    markdown = Redcarpet::Markdown.new Redcarpet::Render::HTML.new(hard_wrap: true), autolink: true, underline: true, fenced_code_blocks: true, strikethrough: true, disable_indented_code_blocks: true, no_intra_emphasis: true
    markdown.render(text)
  end

  def set_revision_number
    self.revision = asset.revision
  end

  def out_of_date?
    self.revision < asset.revision
  end

  def parse_for_mentions
    match_groups = self.body.scan(/@[a-z0-9\-_]*/i)
    return if match_groups.nil?
    match_groups.map! { |m| m[1..-1].downcase }
    match_groups.uniq!
    match_groups.each do |match|
      user = User.all.where("lower(username) = ?", match).first
      unless user.nil?
        Notification.new_mention!(commenter, user, self)
        self.body.gsub!(/#{match}/i, "**@#{match}**")
      else
        self.body.gsub!(/#{match}/i, "~~@#{match}~~")
      end
    end
  end
end
