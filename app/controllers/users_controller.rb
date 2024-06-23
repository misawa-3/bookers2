class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :set_new_book, only: [:show, :index]
  before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @user = current_user
    @users = User.all
  end

  def show
    @books = @user.books
  end
  
  def edit
  end
  

  def update
    if @user.update(user_params)
      flash[:notice] = "Profile was successfully updated."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end


  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def set_new_book
    @new_book = Book.new
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to current_user
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end