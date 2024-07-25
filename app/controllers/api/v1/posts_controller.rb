class Api::V1::PostsController < ApplicationController
  before_action :find_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.all 
    render json: @posts
  rescue => e
    render json: { error: e.message }, status: :internal_server_error
  end

  def show
    render json: @post
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Post not found' }, status: :not_found
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      render json: { message: 'Post successfully updated.' }, status: :ok
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    render json: { message: 'Post successfully deleted.' }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Post not found' }, status: :not_found
  end

  private

  def post_params
    params.require(:post).permit(:post, :user_id)
  end

  def find_post
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Post not found' }, status: :not_found
  end
end
