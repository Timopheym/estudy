class AddPreviewToInfographics < ActiveRecord::Migration
  def change
    change_table :infographics do |t|
      t.string  :preview,       :default => "stub.jpg"
    end
  end
end
