module Site
  class PostsController < ApplicationController
    def index
      excluded_ids = []

      #@main = Post.where(highlight: :main).order(publication_date: :desc).first
      @main = Post.main.published.first
      excluded_ids << @main.id
      @secondary = Post.where(highlight: :secondary).order(publication_date: :desc).take(2)
      excluded_ids << @secondary.map(&:id)
      # flatten
      # [1, [2, 3]].flatten => [1, 2, 3]
      #               @secondary.map { |a| a.id }
      @pagy, @records = pagy(Post.where.not(id: excluded_ids.flatten!))
      excluded_ids << @records.map(&:id).flatten
      @side = Post.where.not(id: excluded_ids.flatten!).order(publication_date: :desc).take(3)
    end

    def show
      @post = Post.find(params[:id])
    end
  end
end