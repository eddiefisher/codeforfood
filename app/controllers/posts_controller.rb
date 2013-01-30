class PostsController < ApplicationController
  puffer_pages

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end
end
