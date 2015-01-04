class Beer < ActiveRecord::Base
  belongs_to :brewery
  belongs_to :style
  has_many :reviews

  validates :name, presence: true, uniqueness: { scope: :brewery_id, case_sensitive: false }
  validates :brewery_id, presence: true
  validates :style_id, presence: true
  
  def average_rating
    if self.reviews.exists?
      rating = 0
      self.reviews.each do |review|
        rating += review.rating
      end  
      rating = rating/self.reviews.count 
    else
      rating = "no ratings yet" 
    end
  end  
end  