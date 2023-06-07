module admin
  class CategoriesController < ApplicationController
    before_action :set_categorie, only: %i[ show edit update destroy ]

    def index
      @categories = Categorie.all
    end

    def show; end

    def new
      @categorie = Categorie.new
    end

    def edit; end

    def create
      @categorie = Categorie.new(categorie_params)

      if @categorie.save
        redirect_to admin_categorie_url(@categorie), notice: "Categories was succefully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @categorie.update(categorie_params)
        redirect_to categorie_post_url(@categorie), notice: "Categories was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @categorie.destroy
      edirect_to admin_categories_path
    end

    private
    def set_categorie
      @categorie = Categorie.find(params[:id])
    end

    def categorie_params
      params.require(:categorie).permit(:name)
    end

  end
end