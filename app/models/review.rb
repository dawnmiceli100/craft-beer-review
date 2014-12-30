class Review < ActiveRecord::Base
  belongs_to :beer
  belongs_to :user

  validates :rating, presence: true, inclusion: { in: 1...10}
end  