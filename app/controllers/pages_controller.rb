class PagesController < ApplicationController
before_action :authenticate_user!, only: [:adminhome, :sign]
before_action :check_admin?, only: [:adminhome, :sign]

  def adminhome
      flash[:notice] = "Welcome #{current_user.username}!"
  end
  
  def wait
  end
  
  def home
  end

  def about
  end
  
  def gettingstarted
  end
 
  def sign
      user = User.find(params[:id])
      sign_in_and_redirect(user)
  end 
  
  private 
  
  def check_admin?
    unless current_user.admin?
        redirect_to notes_path
        flash[:notice] = 'Access denied'
    end
  end
  
end
