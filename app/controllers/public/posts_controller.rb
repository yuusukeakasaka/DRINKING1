class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
       redirect_to post_path(@post.id)
    else
       render :new
    end
  end

  def index
    @posts = Post.where(user_id: [current_user.id, *current_user.following_ids]).reverse_order #フォローワーと自分の投稿一覧
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def search
    @posts = Post.search(params[:q])
    render "index"
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :image)
  end

end
