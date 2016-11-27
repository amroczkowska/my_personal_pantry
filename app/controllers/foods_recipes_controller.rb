class FoodsRecipesController < ApplicationController
  def index
    @q = FoodsRecipe.ransack(params[:q])
    @foods_recipes = @q.result(:distinct => true).includes(:foods, :recipes).page(params[:page]).per(10)

    render("foods_recipes/index.html.erb")
  end

  def show
    @foods_recipe = FoodsRecipe.find(params[:id])

    render("foods_recipes/show.html.erb")
  end

  def new
    @foods_recipe = FoodsRecipe.new

    render("foods_recipes/new.html.erb")
  end

  def create
    @foods_recipe = FoodsRecipe.new

    @foods_recipe.foods_id = params[:foods_id]
    @foods_recipe.recipes_id = params[:recipes_id]

    save_status = @foods_recipe.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/foods_recipes/new", "/create_foods_recipe"
        redirect_to("/foods_recipes")
      else
        redirect_back(:fallback_location => "/", :notice => "Foods recipe created successfully.")
      end
    else
      render("foods_recipes/new.html.erb")
    end
  end

  def edit
    @foods_recipe = FoodsRecipe.find(params[:id])

    render("foods_recipes/edit.html.erb")
  end

  def update
    @foods_recipe = FoodsRecipe.find(params[:id])

    @foods_recipe.foods_id = params[:foods_id]
    @foods_recipe.recipes_id = params[:recipes_id]

    save_status = @foods_recipe.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/foods_recipes/#{@foods_recipe.id}/edit", "/update_foods_recipe"
        redirect_to("/foods_recipes/#{@foods_recipe.id}", :notice => "Foods recipe updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Foods recipe updated successfully.")
      end
    else
      render("foods_recipes/edit.html.erb")
    end
  end

  def destroy
    @foods_recipe = FoodsRecipe.find(params[:id])

    @foods_recipe.destroy

    if URI(request.referer).path == "/foods_recipes/#{@foods_recipe.id}"
      redirect_to("/", :notice => "Foods recipe deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Foods recipe deleted.")
    end
  end
end
