class BreweryStyle < ActiveRecord::Base
  belongs_to :brewery
  belongs_to :style
end  