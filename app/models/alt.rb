class Alt < ApplicationRecord

  include ImageUploader::Attachment(:image)
  #include MeiliSearch::Rails
  searchkick word_start: [:title, :tags, :body], filterable: [:tags]
  

  acts_as_taggable 
  scope :search_import, -> { includes(:tags) }

  has_rich_text :orginal_url

  belongs_to :user
  has_many :alt_favorites, dependent: :destroy
  has_many :alt_texts, dependent: :destroy

  scope :dup_alt_sort, -> {order(created_at: :asc)}
  # has_many :verifcations, dependent: :destroy

  # limit what is indexed
  def search_data
  {
    title: title,
    tags: tags.join(" "),
    body: alt_texts.pluck(:body).last,
    verified: verified
 
  }
  end

  def is_duplicate_initiate
    is_duplicate
  end

  def is_duplicate
    require 'phashion'
    file1 = URI.parse(image_url).open
    puts file1.class
   
    img_mod = Phashion::Image.new(file1.path)
    count = 0
    @all_alt = Alt.all
    a = []
    @all_alt.dup_alt_sort.map  { |u| 

       if u.image_url != nil
      
        file2 = URI.parse(u.image.url).open
        if img_mod.duplicate?(Phashion::Image.new(file2.path)) == true
          count = count + 1
          a << u.id
          a.sort
           if count == 2
            b = a.first
            update(duplicate_check: true, image_dup_locate: b)
            a_alt = Alt.find_by(id: b)
            binding.pry
          end
        end 
      end
    }
    update(check_performed: true)
    return false
  end

  def build_alt_text_versions(is_alt_dup)
    @alt_text = alt.new(body: a.body, user_id: current_user.id, alt_id: a.id)
    @alt_text.save
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
