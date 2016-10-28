class AvailablesController < ApplicationController
  def index
    @availables = Available.all
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
    @available.purchase_date = params[:purchase_date]
    @available.expiration_date = params[:expiration_date]
    @available.perishable_ind = params[:perishable_ind]
    @available.storage_area = params[:storage_area]
    @available.type = params[:type]

    if @available.save
      redirect_to "/availables", :notice => "Available created successfully."
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
    @available.purchase_date = params[:purchase_date]
    @available.expiration_date = params[:expiration_date]
    @available.perishable_ind = params[:perishable_ind]
    @available.storage_area = params[:storage_area]
    @available.type = params[:type]

    if @available.save
      redirect_to "/availables", :notice => "Available updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @available = Available.find(params[:id])

    @available.destroy

    redirect_to "/availables", :notice => "Available deleted."
  end
end
