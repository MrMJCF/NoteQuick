class CategoriesController < ApplicationController
before_action :authenticate_user!
before_action :check_admin?

  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save 
      redirect_to pages_adminhome_path
    else
      render 'new'
    end
  end

  def edit
      @category = Category.find(params[:id])
  end

  def update
      @category = Category.find(params[:id])
      @category.save
      if @category.save
          redirect_to pages_adminhome_path
      else
          render 'edit'
      end
  end
  
  def destroy 
      @category = Category.find(params[:id])
      @category.destroy
      if @category.destroy
        redirect_to pages_adminhome_path
      else
        render 'edit'
      end
  end
  
  private 
  
  def check_admin?
    unless current_user.admin? 
      redirect_to root_path
      flash[:notice] = 'Access Denied'
    end
  end
  
  def category_params
    params.require(:category).permit(:name)
  end 
end
