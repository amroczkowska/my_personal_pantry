class AvailablesController < ApplicationController
  def index
    avails = Available.where({:user_id => current_user.id})
    @nonull = avails.where("expiration_date is not null").order("expiration_date asc")
    @yesnull = avails.where("expiration_date is null")
    @availables = @nonull + @yesnull

  end

  def show
    @available = Available.find(params[:id])
  end

  def new
    @available = Available.new
  end

  def create
    @available = Available.new
    @available.foods_id = params[:foods_id]
    @available.quantity = params[:quantity]

    @available.expiration_date = params[:expiration_date]

    @available.user_id = params[:user_id]
    @available.storage_area = params[:storage_area]
    @available.size = params[:size]

    if @available.save
      redirect_to "/availables", :notice => "Pantry Item created successfully."
    else
      render 'new'
    end
  end

  def edit
    @available = Available.find(params[:id])
  end

  def update
    @available = Available.find(params[:id])

    @available.foods_id = params[:foods_id]
    @available.quantity = params[:quantity]

    @available.expiration_date = params[:expiration_date]
    @available.user_id = params[:user_id]
    @available.storage_area = params[:storage_area]
    @available.size = params[:size]

    if @available.save
      redirect_to "/availables", :notice => "Pantry Item updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @available = Available.find(params[:id])

    @available.destroy

    redirect_to "/availables", :notice => "Pantry Item deleted."
  end
end
