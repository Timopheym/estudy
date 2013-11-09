class CreateCategoryTable < ActiveRecord::Migration
  def up
    create_table :categories do |t|
      t.integer :name
    end
  end

  def down
  end
end
