class AdminController < ApplicationController
  
  def index
   
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new post_params
    
    if @category.save
      redirect_to :root, notice: "Your Category Has Been Created!"
    else
      render 'new', notice: "Oh no! That didn't work!"
    end
  end
  
  def show
    @categories = Category.all 
  end
  
  def edit
  end
  
  def destroy
    @category.destroy
    redirect_to category_path
  end
  
  private
  
  def post_params
    params.require(:category).permit(:name)
  end
  
  
end
