class ReviewsController < ApplicationController
  before_action :require_user, except: [:index, :show]
  before_action :set_beer, only:[:new, :create]
  
  def index
    @reviews = Review.order(created_at: :desc).limit(3)
  end  

  def new
    @review = Review.new
  end
  
  def create
    @review = @beer.reviews.new(review_params)
    @review.user = current_user
    
    if @review.save
      flash[:notice] = "Your review has been saved."
      redirect_to beer_path(@beer)
    else
      render 'new'
    end    
  end  

  def review_params
    params.require(:review).permit(:body, :rating)
  end  

  def set_beer
    @beer = Beer.find_by(slug: params[:beer_id])
  end     
end  