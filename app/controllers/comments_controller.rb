class CommentsController < ApplicationController
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

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
