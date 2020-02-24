class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  

  version :schema do
    process resize_to_fill: [800, 800, "Center"]
  end

  def default_url(*args)
      "default.jpg"
  end

end
