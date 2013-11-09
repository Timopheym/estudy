class CreateInfographicCategoryJoinTable < ActiveRecord::Migration
  def up

    create_table :infographic_category do |t|
      t.references :infographic, :null => false
      t.references :category, :null => false

      t.timestamps
    end

    add_index(:infographic_category, [:infographic_id, :category_id], :unique => true)
  end

  def down
  end
end
