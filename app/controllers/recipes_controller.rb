class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new
    @recipe.name = params[:name]
    @recipe.url = params[:url]
    @recipe.instructions = params[:instructions]
    @recipe.ease = params[:ease]
    @recipe.type = params[:type]

    if @recipe.save
      redirect_to "/recipes", :notice => "Recipe created successfully."
    else
      render 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])

    @recipe.name = params[:name]
    @recipe.url = params[:url]
    @recipe.instructions = params[:instructions]
    @recipe.ease = params[:ease]
    @recipe.type = params[:type]

    if @recipe.save
      redirect_to "/recipes", :notice => "Recipe updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    @recipe.destroy

    redirect_to "/recipes", :notice => "Recipe deleted."
  end
end
