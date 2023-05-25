class Admin::PostController < ApplicationController
  before :set_post, only: %i[ show edit update destroy ]

  def index
    @posts = Post.all
  end

  def show; end

  def new 
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(customer_params)

    if @post.save
      redirect_to post_url(@post), notice: "Post was successfully created."  
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_url(@post), notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def customer_params
      params.require(:post).permit(:title, :resume, :publication_date, :content)
    end

end