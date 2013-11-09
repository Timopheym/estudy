class Category
  attr_accessible :img, :date
  has_many  :infographics, :through => :infographic_category
  attr_accessible :id

end