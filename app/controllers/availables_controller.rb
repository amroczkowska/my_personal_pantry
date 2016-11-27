class AvailablesController < ApplicationController
  def index
    @q = Available.ransack(params[:q])
    @availables = @q.result(:distinct => true).includes(:foods, :similar_foods_availables, :similar_foods).page(params[:page]).per(10)

    render("availables/index.html.erb")
  end

  def show
    @availables_similar = AvailablesSimilar.new
    @available = Available.find(params[:id])

    render("availables/show.html.erb")
  end

  def new
    @available = Available.new

    render("availables/new.html.erb")
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

    save_status = @available.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/availables/new", "/create_available"
        redirect_to("/availables")
      else
        redirect_back(:fallback_location => "/", :notice => "Available created successfully.")
      end
    else
      render("availables/new.html.erb")
    end
  end

  def edit
    @available = Available.find(params[:id])

    render("availables/edit.html.erb")
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

    save_status = @available.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/availables/#{@available.id}/edit", "/update_available"
        redirect_to("/availables/#{@available.id}", :notice => "Available updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Available updated successfully.")
      end
    else
      render("availables/edit.html.erb")
    end
  end

  def destroy
    @available = Available.find(params[:id])

    @available.destroy

    if URI(request.referer).path == "/availables/#{@available.id}"
      redirect_to("/", :notice => "Available deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Available deleted.")
    end
  end
end
