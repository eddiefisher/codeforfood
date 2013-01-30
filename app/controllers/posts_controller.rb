class PostsController < ApplicationController
  puffer_pages

  def index
    @posts = Post.all
    render 'posts'
  end

  def show
    @post = Post.find(params[:id])
    redirect_to @post, status: 301 if request.path != post_path(@post)
  end
end
