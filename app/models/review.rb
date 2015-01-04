class Review < ActiveRecord::Base
  belongs_to :beer
  belongs_to :user

  validates :rating, presence: true
  validates :body, presence: true
end  