class Public::HomesController < ApplicationController

  def top
    @posts = Post.all.reverse_order
    @post_comment = PostComment.new
  end

  def about
  end

  def search
    @posts = Post.search(params[:q])
    render "top"
  end

end
