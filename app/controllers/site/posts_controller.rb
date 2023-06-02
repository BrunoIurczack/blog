module Site
  class PostsController < ApplicationController
    def index
      @pagy, @records = pagy(Post.all)
    end

    def show
      @post = Post.find(params[:id])
    end
  end
end