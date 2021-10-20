class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.save!
      flash[:notice] = "User was created successfully."
      redirect_to user_path(@user.id)
    else
      render 'new'
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:notice] = "User was updated successfully."
        redirect_to users_path
      else
        render 'edit'
      end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "User was deleted successfully."
    end
    redirect_to users_path
  end

  def articles
    @user = User.find(params[:id])
    @articles = @user.articles
  end
  private
  def user_params
    params.require(:user).permit(:username, :email,:id)
  end

  end






