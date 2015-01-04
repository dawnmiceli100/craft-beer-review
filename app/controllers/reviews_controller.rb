class ReviewsController < ApplicationController
  def index
    @reviews = Review.order(created_at: :desc).limit(5)
  end  

  def new
    @beer = Beer.find(params[:beer_id])
    @review = Review.new
  end
  
  def create
    @beer = Beer.find_by(id: params[:beer_id])
    @review = @beer.reviews.new(review_params)
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
end  