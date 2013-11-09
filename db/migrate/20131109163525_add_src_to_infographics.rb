class AddSrcToInfographics < ActiveRecord::Migration
  def change
    change_table :infographics do |t|
      t.string  :src,       :default => "stub.jpg"
    end
  end
end
