class Project < ActiveRecord::Base
  has_many :assets
  has_and_belongs_to_many :users
  validates :name, :description, presence: true
  validates :homepage, format: /https?:\/\/[\S]+/i, allow_nil: true
end
