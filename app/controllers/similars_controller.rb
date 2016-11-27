class SimilarsController < ApplicationController
  def index
    @q = Similar.ransack(params[:q])
    @similars = @q.result(:distinct => true).includes(:foods, :similar_foods_availables, :availables).page(params[:page]).per(10)

    render("similars/index.html.erb")
  end

  def show
    @availables_similar = AvailablesSimilar.new
    @similar = Similar.find(params[:id])

    render("similars/show.html.erb")
  end

  def new
    @similar = Similar.new

    render("similars/new.html.erb")
  end

  def create
    @similar = Similar.new

    @similar.similar_name = params[:similar_name]
    @similar.foods_id = params[:foods_id]

    save_status = @similar.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/similars/new", "/create_similar"
        redirect_to("/similars")
      else
        redirect_back(:fallback_location => "/", :notice => "Similar created successfully.")
      end
    else
      render("similars/new.html.erb")
    end
  end

  def edit
    @similar = Similar.find(params[:id])

    render("similars/edit.html.erb")
  end

  def update
    @similar = Similar.find(params[:id])

    @similar.similar_name = params[:similar_name]
    @similar.foods_id = params[:foods_id]

    save_status = @similar.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/similars/#{@similar.id}/edit", "/update_similar"
        redirect_to("/similars/#{@similar.id}", :notice => "Similar updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Similar updated successfully.")
      end
    else
      render("similars/edit.html.erb")
    end
  end

  def destroy
    @similar = Similar.find(params[:id])

    @similar.destroy

    if URI(request.referer).path == "/similars/#{@similar.id}"
      redirect_to("/", :notice => "Similar deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Similar deleted.")
    end
  end
end
