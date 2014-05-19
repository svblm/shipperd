class Asset < ActiveRecord::Base
  belongs_to :project
  validates :name, presence: true
  enum state: ['staged', 'shipped', 'abandoned']
end
