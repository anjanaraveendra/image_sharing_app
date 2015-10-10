class UsersController < ApplicationController
	before_filter :signed_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  before_filter :correct_user,   only: [:edit, :update]

  def index
#    @users = User.all
    @users = User.all#paginate(page: params[:page])
  end

  def show 
    @user = User.find(params[:id])
  end

  def new
    unless signed_in?
      @user = User.new
    else 
      redirect_to root_path
    end
  end

  def create
    unless signed_in?
      @user = User.new(params[:user])
      if @user.save
        sign_in @user
        flash[:success] = "Welcome to the New App!"
        redirect_to @user
      else
        render 'new'
      end
    else 
      redirect_to root_path
    end
  end

  def edit
#    @user = User.find(params[:id])
  end

  def update
#    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id])
    if user == current_user
      flash[:error] = "You can't delete yourself."
    else 
      user.destroy
      flash[:success] = "User destroyed."
    end
    redirect_to users_url
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.followed_users#.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers#.paginate(page: params[:page])
    render 'show_follow'
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :current_password, :avatar)
    end

    def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

end
