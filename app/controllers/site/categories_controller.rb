module Site
  class CategoriesController < ApplicationController

    def show
      @category = Category.find(params[:id])
      @posts = @category.posts
    end
  end
end