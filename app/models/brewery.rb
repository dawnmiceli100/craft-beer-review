class Brewery < ActiveRecord::Base
  has_many :beers
  has_many :styles, through: :brewery_styles

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end  