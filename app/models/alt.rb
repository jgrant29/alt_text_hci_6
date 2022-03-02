class Alt < ApplicationRecord
  include ImageUploader::Attachment(:image)
  
  acts_as_taggable

  has_rich_text :orginal_url

  belongs_to :user
  has_many :alt_texts
end
