class Alt < ApplicationRecord
  include ImageUploader::Attachment(:image)
  #include MeiliSearch::Rails
  searchkick

  acts_as_taggable 
  scope :search_import, -> { includes(:tag_taggings) }

  has_rich_text :orginal_url

  belongs_to :user
  has_many :alt_texts

  # limit what is indexed
  def search_data
  {
    
    name_tagged:  "#{name} #{tag_taggings.map(&:name).join(" ")}"
    title: title
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
