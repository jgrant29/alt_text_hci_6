class Alt < ApplicationRecord
  include ImageUploader::Attachment(:image)
  #include MeiliSearch::Rails
  searchkick

  acts_as_taggable 
  scope :search_import, -> { includes(:tags) }

  has_rich_text :orginal_url

  belongs_to :user
  has_many :alt_texts

  #scope :search_import, -> { includes(:tag_list) }

  # limit what is indexed
  def search_data
  {
    
    tags: tag_list
   # body: body
  }
  end


   # attributes that we want to be indexed
  #meilisearch do
  #  attribute :title
  #  attribute :alt_texts do
  #    alt_texts.pluck(:body)
   # end

  #  attribute :tag_list 

   # sortable_attributes [:created_at, :updated_at]
 # end
  
end
