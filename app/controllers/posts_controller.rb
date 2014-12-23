class PostsController < ApplicationController
  before_action :authenticate_user, :except => [:index, :show]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to post_path @post, notice: "Post posted"
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = current_user.posts.find_by(id: params[:id])
    if !@post
      redirect_to post_path(params[:id]), notice: "Can't touch this!"
    end
  end

  def update
    @post = current_user.posts.find_by(id: params[:id])
    @post.update(post_params)
    if @post.save
      redirect_to post_path @post, notice: "Your typos have vanished"
    else
      render :edit
    end
  end

  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    if @post
      @post.destroy
      redirect_to posts_path, notice: "Post successfully burninated"
    else
      redirect_to root_path, notice: "You're so vain, you probably think you own that post."
    end
  end

  private
  def post_params
    params.require(:post).permit(:subject, :post_text)
  end

end
