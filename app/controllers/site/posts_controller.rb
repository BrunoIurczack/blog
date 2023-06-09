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

    def by_month
      date = Date.strptime(params[:date], '%Y-%m')
      @pagy, @records = pagy(Post.where("publication_date between ? and ?", date.beginning_of_month, date.end_of_month).all)
    end

    def search
      @term = search_param[:t]
      @pagy, @records = pagy(
        (Post.where("title ilike ?", "%#{search_param[:t]}%")).or(Post.where("resume ilike ?", "%#{search_param[:t]}%")).or(Post.where("content ilike ?", "%#{search_param[:t]}%"))
      )
    end

    private

    def search_param
      params.require(:search).permit(:t)
    end
  end
end