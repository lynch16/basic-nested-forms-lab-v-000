class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: 'flour')
    @recipe.ingredients.build(name: 'wheat')
  end

  def create
    @recipe = Recipe.new(recipe_params)

    binding.pry
    if @recipe.save
        redirect_to recipe_path(@recipe)
    else
        render :new
    end
  end

  private
  def recipe_params
      params.require(:recipe).permit(
        :title,
        ingredients_attributes: [
            :name
          ]
        )
  end
end
