class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.visible_to(current_user)
    
    @current_user_favorite_posts = current_user_favorite_posts
  end

  def confirm
    @user = User.new(user_params)
    render :new unless @user.valid?
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Welcome to Bloccit #{@user.name}!"
      create_session(@user)
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error creating your account. Please try again."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :password_digest)
  end

  def current_user_favorite_posts
    if current_user
      current_user.favorites.map{ |f| Post.find(f.post_id) }
    else
      []
    end
  end

end
