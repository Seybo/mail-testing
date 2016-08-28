class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :destroy, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new user_params

    if @user.save
      UserMailer.signup_confirmation(@user).deliver
      redirect_to @user, notice: 'Welcome!'
    else
      render 'new', notice: "Emmmm... not really... can't do it..."
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name)
  end

  def find_user
    @user = User.find(params[:id])
  end
end

# before_action :find_post, only: [:show, :edit, :destroy, :update]
# unless Rails.env.development?
#   before_action :authenticate_user!, except: [:index, :show]
# end

# def index
#   @posts = Post.order(published_at: :desc)
# end

# def new
#   @post = Post.new(published_at: DateTime.now.change(offset: '-3000'))
# end

# def show
# end

# def edit
# end

# def update
#   if @post.update post_params
#     redirect_to @post, notice: 'Yay! Article::SAVED'
#   else
#     render 'edit'
#   end
# end

# def destroy
#   @post.destroy
#   redirect_to posts_path
# end

# private

# def post_params
#   params.require(:post).permit(:title, :body, :image, :published_at, :slug, :category_id)
# end

# def find_post
#   @post = Post.friendly.find(params[:id])
# end