class Admins::PostsController < ApplicationController

  def index
    @posts = Post.all.reverse_order
  end

  def destroy
    Post.find_by(id: params[:id]).destroy
    redirect_to admins_posts_path
  end

end
