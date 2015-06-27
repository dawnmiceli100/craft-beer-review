class BeersController < ApplicationController
  before_action :require_user, except: [:index, :show]
  def index
    @beers = Kaminari.paginate_array(Beer.all.sort_by {|x| [x.brewery_name, x.name]}).page(params[:page]).per(10)
  end

  def show
    @beer = Beer.find_by(slug: params[:id])
    @reviews = @beer.reviews.order(created_at: :desc).page(params[:page]).per(2)
  end  
  
  def new
    @beer = Beer.new
  end
  
  def create
    @beer = Beer.new(beer_params)

    if @beer.save
      flash[:notice]  = "#{brewery_plus_beer_name(@beer)} has been successfully added."
      redirect_to @beer
    else
      render 'new'
    end
  end

  def beer_params
    params.require(:beer).permit(:name, :brewery_id, :style_id)
  end  

end  