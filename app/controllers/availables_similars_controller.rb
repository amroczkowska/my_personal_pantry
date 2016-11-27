class AvailablesSimilarsController < ApplicationController
  def index
    @q = AvailablesSimilar.ransack(params[:q])
    @availables_similars = @q.result(:distinct => true).includes(:availables, :similar_foods).page(params[:page]).per(10)

    render("availables_similars/index.html.erb")
  end

  def show
    @availables_similar = AvailablesSimilar.find(params[:id])

    render("availables_similars/show.html.erb")
  end

  def new
    @availables_similar = AvailablesSimilar.new

    render("availables_similars/new.html.erb")
  end

  def create
    @availables_similar = AvailablesSimilar.new

    @availables_similar.similar_id = params[:similar_id]
    @availables_similar.availables_id = params[:availables_id]

    save_status = @availables_similar.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/availables_similars/new", "/create_availables_similar"
        redirect_to("/availables_similars")
      else
        redirect_back(:fallback_location => "/", :notice => "Availables similar created successfully.")
      end
    else
      render("availables_similars/new.html.erb")
    end
  end

  def edit
    @availables_similar = AvailablesSimilar.find(params[:id])

    render("availables_similars/edit.html.erb")
  end

  def update
    @availables_similar = AvailablesSimilar.find(params[:id])

    @availables_similar.similar_id = params[:similar_id]
    @availables_similar.availables_id = params[:availables_id]

    save_status = @availables_similar.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/availables_similars/#{@availables_similar.id}/edit", "/update_availables_similar"
        redirect_to("/availables_similars/#{@availables_similar.id}", :notice => "Availables similar updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Availables similar updated successfully.")
      end
    else
      render("availables_similars/edit.html.erb")
    end
  end

  def destroy
    @availables_similar = AvailablesSimilar.find(params[:id])

    @availables_similar.destroy

    if URI(request.referer).path == "/availables_similars/#{@availables_similar.id}"
      redirect_to("/", :notice => "Availables similar deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Availables similar deleted.")
    end
  end
end
