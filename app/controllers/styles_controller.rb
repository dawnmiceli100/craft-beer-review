class StylesController < ApplicationController
  before_action :require_user, except: [:index, :show]
  
  def index
    @styles = Style.all.page(params[:page]).per(10)
  end

  def show
    @style = Style.find_by(slug: params[:id])
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