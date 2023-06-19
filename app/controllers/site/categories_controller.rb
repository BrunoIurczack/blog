module Site
  class CategoriesController < ApplicationController

    def show
      @category = Category.find(params[:id])
      @posts = @category.posts
      @pagy, @records = pagy(Category.all)
    end
  end
end