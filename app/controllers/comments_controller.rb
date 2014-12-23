class CommentsController < ApplicationController
  before_action :authenticate_user, :except => [:index, :show]
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
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to post_comment_path(@post, @comment), notice: "You troll, you."
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
      redirect_to post_comments_path(@post), notice: "You fixed your typo!"
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
