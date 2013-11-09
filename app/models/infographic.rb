class Infographic < ActiveRecord::Base
  # attr_accessible :title, :body
  #mount_uploader :src, InfograficUploader
  attr_accessible :id
  has_many  :categories, :through => :infographic_category
end
