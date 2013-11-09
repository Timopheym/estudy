# encoding: UTF-8
class InfographicsController < ApplicationController
  def index
    # Build the JSON Search Normalized Object
    @infografics = Infographic.find()
    @comments = Array.new

    #@conversation_comments.each do |comment|
      @comments << {
          :id => 1,
          :level => 1,
          :content => 'asd',
          :parent_id => 1,
          :user_id => 1,
          :created_at => 1
      }
    #end

    render :json => @comments
  end

  def top
    # Build the JSON Search Normalized Object
    @infografics = Infographic.find()
    @comments = Array.new

    #@conversation_comments.each do |comment|
      @comments << {
          :id => 1,
          :level => 1,
          :content => 'asd',
          :parent_id => 1,
          :user_id => 1,
          :created_at => 1
      }
    #end

    render :json => @comments
  end

  def categories
    render :json => [
        {:id => 1, :name => "Политика"},
        {:id => 2, :name => "здоровье"},
        {:id => 3, :name => "космос"},
        {:id => 4, :name => "технологий"},
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