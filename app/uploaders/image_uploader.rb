require "image_processing/mini_magick"

class ImageUploader < Shrine
  plugin :determine_mime_type
	plugin :add_metadata

  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)
 
    { 
      small:    magick.resize_to_fit!(800, 800),
    }
  end

  Attacher.validate do
      img_mod = Phashion::Image.new(file.open.path)
      count = 0
      Alt.all.map { |u| 

        puts u.title
        
        file2 = URI.parse(u.image.url).open
        
        
        if img_mod.duplicate?(Phashion::Image.new(file2.path)) == true
            count = count + 1
            if count == 2
              errors << "Image is a duplicate" 
            end 
        end 
      }
    end
  end

end