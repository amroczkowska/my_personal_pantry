class FoodsRecipesController < ApplicationController
  def index
    @foods_recipes = FoodsRecipe.all
  end

  def show
    @foods_recipe = FoodsRecipe.find(params[:id])
  end

  def new
    @foods_recipe = FoodsRecipe.new
  end

  def create
    @foods_recipe = FoodsRecipe.new
    @foods_recipe.foods_id = params[:foods_id]
    @foods_recipe.recipes_id = params[:recipes_id]

    if @foods_recipe.save
      redirect_to "/foods_recipes", :notice => "Foods recipe created successfully."
    else
      render 'new'
    end
  end

  def edit
    @foods_recipe = FoodsRecipe.find(params[:id])
  end

  def update
    @foods_recipe = FoodsRecipe.find(params[:id])

    @foods_recipe.foods_id = params[:foods_id]
    @foods_recipe.recipes_id = params[:recipes_id]

    if @foods_recipe.save
      redirect_to "/foods_recipes", :notice => "Foods recipe updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @foods_recipe = FoodsRecipe.find(params[:id])

    @foods_recipe.destroy

    redirect_to "/foods_recipes", :notice => "Foods recipe deleted."
  end
end
