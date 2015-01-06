class AddSlugToBreweries < ActiveRecord::Migration
  def change
    add_column :breweries, :slug, :string
  end
end
