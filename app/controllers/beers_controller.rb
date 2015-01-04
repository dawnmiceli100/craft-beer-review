class BeersController < ApplicationController
  def index
    @beers = Beer.order(:name)
  end

  def show
    @beer = Beer.find(params[:id])
  end  
  
  def new
    @beer = Beer.new
  end
  
  def create
    @beer = Beer.new(beer_params)

    if @beer.save
      flash[:notice] = "#{@beer.brewery.name} #{@beer.name} has been successfully added."
      redirect_to @beer
    else
      render 'new'
    end
  end

  def beer_params
    params.require(:beer).permit(:name, :brewery_id, :style_id)  
  end          
end  