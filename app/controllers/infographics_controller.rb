# encoding: UTF-8
class InfographicsController < ApplicationController
  def index
    # Build the JSON Search Normalized Object
    @infografics = Infographic.all()
    render :json => @infografics
  end

  def top
    @infografics = Infographic.all()
    render :json => @infografics
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
    render :json => [
        {:id => 1, :name => "Политика"},
        {:id => 2, :name => "Здоровье"},
        {:id => 3, :name => "Космос"},
        {:id => 4, :name => "Технологий"},
        {:id => 5, :name => "СМИ"},
        {:id => 6, :name => "Животные"},
        {:id => 7, :name => "Юристы"},
        {:id => 8, :name => "Экономика"},
        {:id => 9, :name => "Транспорт"},
        {:id => 10, :name => "Интересное"},
        {:id => 11, :name => "Еда"},
        {:id => 12, :name => "Наука"}
    ]
  end
end