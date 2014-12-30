class CreateBreweryStyles < ActiveRecord::Migration
  def change
    create_table :brewery_styles do |t|
      t.integer :brewery_id
      t.integer :style_id
      t.timestamps
    end
  end
end
