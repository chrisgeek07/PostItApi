class Api::V1::PostsController < ApplicationController
  before_action :find_post, only: [:show, :update, :destroy]
  def index
    @posts = Posts.all 
    render json: @posts
  end

  def show
    render json: @post
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post
    else
      render error: { error: 'Unable to create new post.' }, status: 400
    end
  end

  def update
    if @post
      @post.update(post_params)
      render json: { message: 'Post successfully updated.' }, status: 200
    else
      render error: { error: 'Unable to update post.' }, status: 400
    end
  end

  def destroy
    if @post
      @post.destroy
      render json: { message: 'Post successfully deleted.' }, status: 200
    else
      render error: { error: 'Unable to delete post.' }, status: 400
    end
  end

  private

  def post_params
    params.require(:post).permit(:post, :user_id)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
