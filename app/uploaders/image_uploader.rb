# class ImageUploader < CarrierWave::Uploader::Base
#   # Include MiniMagick support for image processing:
#   include CarrierWave::MiniMagick

#   # Choose what kind of storage to use for this uploader:
#   storage :file
#   # storage :fog

#   # Override the directory where uploaded files will be stored:
#   def store_dir
#     "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
#   end

#   # Provide a default URL as a default if there hasn't been a file uploaded:
#   # (Optional, you can customize this if needed)
#   # def default_url(*args)
#   #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
#   # end

#   # Process files as they are uploaded (Optional, you can add image processing here):
#   process resize_to_fit: [800, 800]

#   # Create different versions of your uploaded files (Optional):
#   version :thumb do
#     process resize_to_fill: [100, 100]
#   end

#   # Add an allowlist of extensions which are allowed to be uploaded:
#   def extension_allowlist
#     %w(jpg jpeg gif png)
#   end

#   # Override the filename of the uploaded files (Optional):
#   # def filename
#   #   "something.jpg" if original_filename
#   # end
# end
class ImageUploader < Shrine
  Attacher.validate do
    validate_mime_type %w[image/jpeg image/png image/webp]
    validate_max_size  1*1024*1024
  end
end
