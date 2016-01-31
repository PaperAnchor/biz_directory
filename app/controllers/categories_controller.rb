class CategoriesController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  
  def index
   @category = Category.new
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new post_params
    
    if @category.save
      redirect_to :categories, notice: "Your Category Has Been Created!"
    else
      render 'new', notice: "Oh no! That didn't work!"
    end
  end
  
  def show
    @categories = Category.all 
  end
  
  def edit
  end
  
  private
  
  def post_params
    params.require(:category).permit(:name)
  end
  
end
