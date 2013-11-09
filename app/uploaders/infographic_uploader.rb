# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  resize_to_limit(1024, 768)

  #Change the size in two steps, height first then width
  def two_step_resize(img, filename, max_x, max_y)
    x = img.columns
    y = img.rows

    #make sure it's a float w/ the 1.0*
    ratio = (1.0*x)/y

    new_y = max_y
    new_x = ratio * new_y

    if (new_x > max_x)
      new_x = max_x
      new_y = new_x / ratio
    end

    # do the change in two steps, first the height
    img.resize!(x, new_y);
    #then the width
    img.resize!(new_x, new_y)

  end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  def scale(width, height)
    resize_to_fill(width, height)
  end


  def scale_to_height( height)
    manipulate! do |img|
      Rails.logger.debug img
      ratio = img.rows.to_i/img.columns.to_i
      width = ratio * height
      img = img.resize_to_fill(width, height)
      img
    end
  end

  # Create different versions of your uploaded files:
  version :medium do
    #process :scale_to_height => [500]
    process :scale => [300, 300]
  end

  version :thumb do
    process :scale_to_height => [200]
    #process :scale => [200, 200]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png tiff tif)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
