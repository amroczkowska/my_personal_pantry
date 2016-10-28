Rails.application.routes.draw do
  # Routes for the Similar resource:
  # CREATE
  get "/similars/new", :controller => "similars", :action => "new"
  post "/create_similar", :controller => "similars", :action => "create"

  # READ
  get "/similars", :controller => "similars", :action => "index"
  get "/similars/:id", :controller => "similars", :action => "show"

  # UPDATE
  get "/similars/:id/edit", :controller => "similars", :action => "edit"
  post "/update_similar/:id", :controller => "similars", :action => "update"

  # DELETE
  get "/delete_similar/:id", :controller => "similars", :action => "destroy"
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
