class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.all
  end

  def show
    @brewery = Brewery.find(params[:id])
    @beers = @brewery.beers
  end  
  
  def new
    @brewery = Brewery.new
  end 

  def create
    @brewery = Brewery.new(brewery_params)
    if @brewery.save
      flash[:notice] = "#{@brewery.name} has been successfully added."
      redirect_to breweries_path
    else
      render 'new'
    end    
  end 

  def brewery_params
    params.require(:brewery).permit(:name)
  end  
end  