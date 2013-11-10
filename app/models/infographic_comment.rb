# encoding: UTF-8
class InforaphicComment < ActiveRecord::Base
  attr_accessible :author, :text
  belongs_to :infographic

end
