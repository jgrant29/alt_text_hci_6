require "image_processing/mini_magick"

class ImageUploader < Shrine
  plugin :determine_mime_type
	plugin :add_metadata

  Attacher.derivatives do |original|
    validate_extension %w[jpg jpeg png gif image/webp]
    magick = ImageProcessing::MiniMagick.source(original)
 
    { 
      small:    magick.resize_to_fit!(800, 800),
    }
  end

  

end