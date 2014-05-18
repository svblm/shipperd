class Project < ActiveRecord::Base
  validates :name, :description, :homepage, presence: true
  validates :homepage, format: /https?:\/\/[\S]+/i
end
