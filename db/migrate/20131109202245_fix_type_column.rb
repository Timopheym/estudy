class FixTypeColumn < ActiveRecord::Migration
  def up
    rename_column :infographics, :type, :kind
  end

  def down
  end
end
