class Beer < ActiveRecord::Base
  belongs_to :brewery
  belongs_to :style
  has_many :reviews

  validates :name, presence: true, uniqueness: true
end  