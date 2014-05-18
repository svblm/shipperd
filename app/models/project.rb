class Project < ActiveRecord::Base
  has_many :assets
  has_and_belongs_to_many :users
  validates :name, :description, :homepage, presence: true
  validates :homepage, format: /https?:\/\/[\S]+/i
end
