# encoding: UTF-8
class InfographicsController < ApplicationController
  def index
    # Build the JSON Search Normalized Object
    @infografics = Infographic.all()
    render :json => @infografics
  end

  def top
    @infografics = Infographic.byRate()
    render :json => categoties2results(@infografics)
  end

  def new
    @infografics = Infographic.byDate()
    render :json => categoties2results(@infografics)
  end

  def byCategory
    @infografics = Infographic.with_category(params[:category_id])
    render :json => @infografics
    #render :json => categoties2results(@infografics)
  end

  def upload

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

  def categoties2results (cats)
    result = []
    type = "image"
    cats.each do |infographic|
      result << {
          :title => infographic.name,
          :content => infographic.src.url,
          :thumbnail => infographic.src.thumb.url,
          :type => type
      }
    end
    result
  end
end