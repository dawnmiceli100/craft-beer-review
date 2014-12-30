class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.integer :brewery_id
      t.integer :style_id
      t.timestamps
    end
  end
end
