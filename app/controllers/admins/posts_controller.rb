class Admins::PostsController < ApplicationController

  def index
    @posts = Post.all.reverse_order
  end

end
