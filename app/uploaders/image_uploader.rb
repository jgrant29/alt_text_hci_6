require "image_processing/mini_magick"

class ImageUploader < Shrine
  plugin :determine_mime_type
	plugin :add_metadata

  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)
 
    { 
      x_xl:     magick.resize_to_fit!(2400, 2400),
      xl:       magick.resize_to_fit!(1800, 1800),
      large:    magick.resize_to_fit!(1200, 1200),
      medium:   magick.resize_to_fit!(1000, 1000),
      small:    magick.resize_to_fit!(800, 800),
      xsmall:   magick.resize_to_fit!(570, 570),
    }
  end

  

end