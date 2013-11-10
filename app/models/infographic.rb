class Infographic < ActiveRecord::Base
  attr_accessible :src,:preview
  mount_uploader :src, InfographicUploader
  mount_uploader :preview, InfographicUploader
  attr_accessible :id
  has_many  :categories, :through => :infographic_category
end
