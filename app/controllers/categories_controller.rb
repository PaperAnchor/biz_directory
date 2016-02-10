class CategoriesController < ApplicationController  
  
  def index
   @categories = Category.all
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
  
  def update
    if @category.update post_params
      redirect_to @category, notice: "Yay! The category info has been updated!"
    else
      render 'edit'
    end
  end
  
  def destroy
    @category.destroy
    redirect_to businesses_path
  end
  
  private
  
  def post_params
    params.require(:category).permit(:id)
  end
  
  
end
