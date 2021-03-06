Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)
  root :to => "recipes#index"
  # Routes for the Foods_recipe resource:
  # CREATE
  get "/foods_recipes/new", :controller => "foods_recipes", :action => "new"
  post "/create_foods_recipe", :controller => "foods_recipes", :action => "create"

  # READ
  get "/foods_recipes", :controller => "foods_recipes", :action => "index"
  get "/foods_recipes/:id", :controller => "foods_recipes", :action => "show"

  # UPDATE
  get "/foods_recipes/:id/edit", :controller => "foods_recipes", :action => "edit"
  post "/update_foods_recipe/:id", :controller => "foods_recipes", :action => "update"

  # DELETE
  get "/delete_foods_recipe/:id", :controller => "foods_recipes", :action => "destroy"
  #------------------------------

  # Routes for the Recipe resource:
  # CREATE
  get "/recipes/new", :controller => "recipes", :action => "new"
  post "/create_recipe", :controller => "recipes", :action => "create"

  # READ
  get "/recipes", :controller => "recipes", :action => "index"
  get "/recipes/:id", :controller => "recipes", :action => "show"
  get "/myrecipes", :controller => "recipes", :action => "mine"


  # UPDATE
  get "/recipes/:id/edit", :controller => "recipes", :action => "edit"
  post "/update_recipe/:id", :controller => "recipes", :action => "update"

  # DELETE
  get "/delete_recipe/:id", :controller => "recipes", :action => "destroy"
  #------------------------------

  # Routes for the Available resource:
  # CREATE
  get "/availables/new", :controller => "availables", :action => "new"
  post "/create_available", :controller => "availables", :action => "create"

  # READ
  get "/availables", :controller => "availables", :action => "index"
  get "/availables/:id", :controller => "availables", :action => "show"

  # UPDATE
  get "/availables/:id/edit", :controller => "availables", :action => "edit"
  post "/update_available/:id", :controller => "availables", :action => "update"

  # DELETE
  get "/delete_available/:id", :controller => "availables", :action => "destroy"
  #------------------------------

  # Routes for the Food resource:
  # CREATE
  get "/foods/new", :controller => "foods", :action => "new"
  post "/create_food", :controller => "foods", :action => "create"

  # READ
  get "/foods", :controller => "foods", :action => "index"
  get "/foods/:id", :controller => "foods", :action => "show"

  # UPDATE
  get "/foods/:id/edit", :controller => "foods", :action => "edit"
  post "/update_food/:id", :controller => "foods", :action => "update"

  # DELETE
  get "/delete_food/:id", :controller => "foods", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
