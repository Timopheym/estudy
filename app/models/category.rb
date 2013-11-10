class Category < ActiveRecord::Base
  attr_accessible :name, :id
  has_many  :infographics, :through => :infographic_category

end