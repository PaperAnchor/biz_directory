class AdminController < ApplicationController
  def index
   
  end
  
  def create
    @category = Category.new(params[:id])
    
    if @category.save
      redirect_to :categories, notice: "Your Category Has Been Created!"
    else
      render 'new', notice: "Oh no! That didn't work!"
    end
  end
  
 
end

