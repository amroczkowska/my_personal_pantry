class SimilarsController < ApplicationController
  def index
    @similars = Similar.all
  end

  def show
    @similar = Similar.find(params[:id])
  end

  def new
    @similar = Similar.new
  end

  def create
    @similar = Similar.new
    @similar.similar_name = params[:similar_name]
    @similar.foods_id = params[:foods_id]

    if @similar.save
      redirect_to "/similars", :notice => "Similar created successfully."
    else
      render 'new'
    end
  end

  def edit
    @similar = Similar.find(params[:id])
  end

  def update
    @similar = Similar.find(params[:id])

    @similar.similar_name = params[:similar_name]
    @similar.foods_id = params[:foods_id]

    if @similar.save
      redirect_to "/similars", :notice => "Similar updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @similar = Similar.find(params[:id])

    @similar.destroy

    redirect_to "/similars", :notice => "Similar deleted."
  end
end
