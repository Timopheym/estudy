# encoding: UTF-8

class Infographic < ActiveRecord::Base
  attr_accessible :id, :src,:preview
  mount_uploader :src, InfographicUploader
  mount_uploader :preview, InfographicUploader
  has_many :categories, :through => :infographic_category
  has_many :infographic_category
  has_many :infographic_comment
  belongs_to :category

  def self.byDate
    self.order('created_at').all
  end

  def self.byRate
    self.order('ratingSumm/ratingCount DESC').all
  end

  def self.with_category(category_id)
    if category_id.present?
      logger.debug( :json => self.joins(:infographic_category).where(infographic_categories: {category_id: category_id}))
      self.joins(:infographic_category).where(infographic_categories: {category_id: category_id})
    else
      self
    end
  end

  def self.search(search)
    if search
      self.where("name LIKE '%"+search+"%'")
    else
      self.all
    end
  end
end
