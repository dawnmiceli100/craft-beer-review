class Beer < ActiveRecord::Base
  # modules to include
  include Sluggable

  belongs_to :brewery
  belongs_to :style
  has_many :reviews

  validates :name, presence: true, uniqueness: { scope: :brewery_id, case_sensitive: false }
  validates :brewery_id, presence: true
  validates :style_id, presence: true

  sluggable_column :name
  
  def average_rating
    if self.reviews.exists?
      rating = 0.0
      self.reviews.each do |review|
        rating += review.rating
      end  
      rating = (rating/self.reviews.count).round(1) 
    else
      rating = "no ratings yet" 
    end
  end 

  def brewery_name
    self.brewery.name
  end  
end  