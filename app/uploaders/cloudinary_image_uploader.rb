class CloudinaryImageUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave
  
  version :retina do
    process resize_to_fit: [640, 640]
  end

  version :schema do
    process resize_to_fill: [800, 800, "Center"]
  end

  version :thumb do
    process :resize_to_fit => [50, 50]
  end

  version :ignore do
    process 
  end

end
