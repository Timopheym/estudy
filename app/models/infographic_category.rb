class InfographicCategory  < ActiveRecord::Base
  belongs_to :infographic
  belongs_to :category
  attr_accessible :infographic_id
  attr_accessible :category_id
end