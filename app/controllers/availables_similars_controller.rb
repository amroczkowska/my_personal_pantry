class AvailablesSimilarsController < ApplicationController
  def index
    @availables_similars = AvailablesSimilar.all
  end

  def show
    @availables_similar = AvailablesSimilar.find(params[:id])
  end

  def new
    @availables_similar = AvailablesSimilar.new
  end

  def create
    @availables_similar = AvailablesSimilar.new
    @availables_similar.similar_id = params[:similar_id]
    @availables_similar.availables_id = params[:availables_id]

    if @availables_similar.save
      redirect_to "/availables_similars", :notice => "Availables similar created successfully."
    else
      render 'new'
    end
  end

  def edit
    @availables_similar = AvailablesSimilar.find(params[:id])
  end

  def update
    @availables_similar = AvailablesSimilar.find(params[:id])

    @availables_similar.similar_id = params[:similar_id]
    @availables_similar.availables_id = params[:availables_id]

    if @availables_similar.save
      redirect_to "/availables_similars", :notice => "Availables similar updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @availables_similar = AvailablesSimilar.find(params[:id])

    @availables_similar.destroy

    redirect_to "/availables_similars", :notice => "Availables similar deleted."
  end
end
