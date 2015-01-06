class User < ActiveRecord::Base
  # modules to include
  include Sluggable

  has_many :reviews

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 3}
  
  has_secure_password validations: false

  sluggable_column :username

end  