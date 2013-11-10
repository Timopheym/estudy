# encoding: UTF-8
class InfographicsController < ApplicationController
  def index
    @infografics = Infographic.byRate()
  end
  def get
    type = 'image'
    # Build the JSON Search Normalized Object
    infographic = Infographic.find(params[:id])
    if infographic.ratingCount.to_i == 0
      rating = 0
    else
      rating = infographic.ratingSumm.to_i/infographic.ratingCount.to_i
    end

    comments = InfographicComment.where(infographic_id: params[:id])
    #comments = infographic.infographic_comments

    render :json => {
        :title => infographic.name,
        :content => infographic.src.url,
        :type => type,
        :rating => rating,
        :thumbnail => infographic.src.thumb.url,
        :comments => comments
    }
  end

  def addComment
    infographic = Infographic.find(params[:id])
    c = InfographicComment.new(:author => params[:author], :text => params[:text])
    c.infographic_id = infographic.id
    if c.save!
      render :json => {
          :status => true
      }
    else
      render :json => {
          :status => false
      }
    end
  end

  def setRating
    infographic = Infographic.find(params[:id])
    infographic.ratingSumm = (infographic.ratingSumm.to_i + params[:value].to_i)
    infographic.ratingCount = infographic.ratingCount.to_i + 1
    infographic.save!
    logger.debug(params[:id])
    logger.debug(params[:value])
    render :json => {
        :rating => infographic.ratingSumm.to_i / infographic.ratingCount.to_i
    }
  end

  def top
    @infografics = Infographic.byRate()
    render :json => infografics2results(@infografics)
  end


  def new
    @infografics = Infographic.byDate()
    render :json => infografics2results(@infografics)
  end

  def byCategoryTop
    @infografics = Infographic.with_category(params[:category_id]).byRate()
    render :json => infografics2results(@infografics)
  end
  def byCategoryNew
    @infografics = Infographic.with_category(params[:category_id]).byDate()
    render :json => infografics2results(@infografics)
  end

  def upload

  end

  def search
    @infografics = Infographic.search(params[:query])
    render :json => infografics2results(@infografics)
  end

  def doUpload
    @infographic = Infographic.new(:img => params[:file])
    if @infographic.save
          render :json => [@photo.to_jq_upload].to_json
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  def categories
    @categories = Category.all()
    render :json => @categories
  end

  def infografics2results (cats)
    result = []
    type = "image"
    cats.each do |infographic|
      result << {
          :id => infographic.id,
          :title => infographic.name,
          :thumbnail => infographic.src.thumb.url,
          :type => type
      }
    end
    result
  end
end