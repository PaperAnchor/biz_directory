class BusinessesController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @businesses = Business.all.paginate(page: params[:page], per_page: 6)
  end
  
  def new
    @business = Business.new
  end
  
  def create
    @business = Business.new post_params
    
    if @business.save
      redirect_to @business, notice: "Hell Ya! You posted a new business!"
    else
      render 'new', notice: "Oh no! That didn't work!"
    end
  end
  
  def show
    @businesses = Business.all 
  end
  
  def edit
  end
  
  def update
    if @business.update post_params
      redirect_to @business, notice: "Yay! The business info has been updated!"
    else
      render 'edit'
    end
  end
  
  def destroy
    @business.destroy
    redirect_to businesses_path
  end
  
  private
  
  def post_params
    params.require(:business).permit(:name, :address, :city, :postal, :email, :phone, :url, :description, :keywords, :category, :logo, :audio, :slug)
  end
  
  def find_post
    @business = Business.friendly.find(params[:id])
  end
end
