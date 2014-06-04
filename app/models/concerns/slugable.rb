module Sluggable
  extend ActiveSupport::Concern
  included do
    def self.slugs(attribute)
      @@slug = attribute
    end

    def find(id)
      record = self.class.find(@@slug => id)
      record ||= self.class.find(id) # fallback for numeric id
    end
  end
end
