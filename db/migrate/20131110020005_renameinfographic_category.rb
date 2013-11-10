class RenameinfographicCategory < ActiveRecord::Migration
  def up
    rename_table :infographic_category, :infographic_categories
  end

  def down
  end
end
