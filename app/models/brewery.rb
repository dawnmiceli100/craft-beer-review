class Brewery < ActiveRecord::Base
  # modules to include
  include Sluggable

  has_many :beers
  has_many :styles, through: :brewery_styles

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  sluggable_column :name
  
end  