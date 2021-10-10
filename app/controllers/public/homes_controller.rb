class Public::HomesController < ApplicationController

  def top
    @posts = Post.all.page(params[:page]).per(5).reverse_order
    @post_comment = PostComment.new
  end

  def about
  end

  def search
    @posts = Post.search(params[:q])
    @posts = @posts.page(params[:page])
    render "top"
  end

end
