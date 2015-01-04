class StylesController < ApplicationController
  def index
    @styles = Style.all
  end

  def show
    @style = Style.find(params[:id])
    @beers = @style.beers
  end  
  
  def new
    @style = Style.new
  end 

  def create
    @style = Style.new(style_params)
    if @style.save
      flash[:notice] = "The style #{@style.name} has been successfully added."
      redirect_to styles_path
    else
      render 'new'  
    end  
  end 

  def style_params
    params.require(:style).permit(:name)
  end  
end  