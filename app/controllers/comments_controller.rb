class CommentsController < ApplicationController
  before_action :require_login, :only => [:edit, :update, :destroy]
  before_action do
    @post = Post.find(params[:post_id])
  end

  def index
  end

  def new
    @comment = @post.comments.new
  end

  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      flash[:success] = "Comment posted"
      redirect_to post_comment_path(@post, @comment)
    else
      render :new
    end
  end

  def show
    @comment = @post.comments.find(params[:id])
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def update
    @comment = @post.comments.find(params[:id])
    if @comment.update(comment_params)
      flash[:success] = "You fixed your typo!"
      redirect_to post_comments_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:success] = "Comment has been relesased to the ether."
    redirect_to post_comments_path(@post)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
