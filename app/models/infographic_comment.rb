# encoding: UTF-8
class InfographicComment < ActiveRecord::Base
  attr_accessible :author, :text
  belongs_to :infographic
end
