class Style < ActiveRecord::Base
  # modules to include
  include Sluggable

  has_many :beers
  has_many :breweries, through: :brewery_styles

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  sluggable_column :name
end  