module Admin
  class PostsController < ApplicationController
    before_action :set_post, only: %i[ show edit update destroy ]

    def index
      @pagy, @records = pagy(Post.all)
    end

    def show; end

    def new 
      @post = Post.new
    end

    def edit; end

    def create
      @post = Post.new(post_params)
      @post.image.attach(params[:post][:image]) if params[:post][:image].present?

      if @post.save
        redirect_to admin_post_url(@post), notice: "Post was successfully created."  
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @post.update(post_params)
        @post.image.attach(params[:post][:image]) if params[:post][:image].present?
        redirect_to admin_post_url(@post), notice: "Post was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @post.destroy
      redirect_to admin_posts_path
    end

    private
      def set_post
        @post = Post.find(params[:id])
      end

      def post_params
        params.require(:post).permit(:title, :resume, :publication_date, :content,  :category_id, :hignlight, :image)
      end
  end
end