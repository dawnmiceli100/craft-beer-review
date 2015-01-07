class BeersController < ApplicationController
  before_action :require_user, except: [:index, :show]
  def index
    @beers = Beer.all.sort_by {|x| [x.brewery_name, x.name]}
  end

  def show
    @beer = Beer.find_by(slug: params[:id])
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

end  