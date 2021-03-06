class UsersController < ApplicationController

before_action :authenticate_user!

	def index
	  @user = current_user
	  @users = User.all
	  @post = Post.new
	  posts = Post.all
	  @posts = current_user.posts.all
	end

	def show
  	  @post = Post.new
  	  posts = Post.all
  	  @user = User.find(params[:id])
	  @posts = @user.posts.all
	end

	def edit
	  @user = User.find(params[:id])
	end

	def update
	  @user = User.find(params[:id])
	  if @user_id = current_user.id
	  	@user.update(user_params)
      redirect_to user_path(@user.id)
  	  else
  	  	@post = Post.new
  	  	@posts = Post.all
  	  	@users = User.all
  	  	render:edit
  	  end
	end

	private
	def user_params
	  params.require(:user).permit(:name, :image, :introduction)
	end

end
