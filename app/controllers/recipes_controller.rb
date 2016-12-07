require 'open-uri'

class RecipesController < ApplicationController
  def index
if params[:food_search].nil?

  @random = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l','m', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'].sample
else

  @random = params[:food_search]

end



    @url = 'https://api.edamam.com/search?q='+@random+'&app_id=59982328&app_key=e4916e4bb6a2ed1ccd4f12dcda5108b3'
        @parsed_data = JSON.parse(open(@url).read)

    @recipehits = @parsed_data['count']
    @recipes= @parsed_data['hits']


  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def mine
@recipes = Recipe.where({:user_id => current_user.id})

  end



  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new
    @recipe.name = params[:name]
    @recipe.url = params[:url]
    @recipe.ingrediants = params[:ingrediants]
    @recipe.image = params[:image]
    @recipe.ease = params[:ease]
    @recipe.type = params[:type]
    @recipe.user_id = params[:user_id]

    if @recipe.save
      redirect_to "/myrecipes", :notice => "Recipe created successfully."
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
    @recipe.ingrediants = params[:ingrediants]
    @recipe.ease = params[:ease]
    @recipe.type = params[:type]
    @recipe.user_id = params[:user_id]

    if @recipe.save
      redirect_to "/recipes", :notice => "Recipe updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    @recipe.destroy

    redirect_to "/myrecipes", :notice => "Recipe deleted."
  end

  def query


  end
end
