class Style < ActiveRecord::Base
  has_many :beers
  has_many :breweries, through: :brewery_styles

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end  