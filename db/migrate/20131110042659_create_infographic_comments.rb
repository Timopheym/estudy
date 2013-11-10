# encoding: UTF-8
class CreateInfographicComments < ActiveRecord::Migration
  def change
    create_table :infographic_comments do |t|
      t.string :author
      t.string :text
      t.belongs_to :infographic

      t.timestamps
    end
  end
end
