class CreateInfographics < ActiveRecord::Migration
  def change
    create_table :infographics do |t|
      t.integer :type
      t.references :author
      t.integer :ratingCount
      t.integer :ratingSumm
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
