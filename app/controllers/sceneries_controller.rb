class SceneriesController < ApplicationController
     
  def index
    @sceneris = Scenery.order("id DESC").search(params[:search]).page(params[:page])
  end

  def new
    @scenery = Scenery.new
  end

  def create
    scenery = Scenery.new(scenery_params)
    if scenery.save
      results = Geocoder.search([scenery[:latitude],scenery[:longitude]])
      scenery[:place] = Scenery.get_adress(results)
      @prefecture = results.first.state
      scenery[:prefecture] = @prefecture
      scenery.save
      redirect_to scenery
    else
      redirect_to new_scenery_path, flash: {
        error_messages: scenery.errors.full_messages
      }
    end
  end

  def show
    @scenery = Scenery.find(params[:id])
    # @comment = Comment.new(scenery_id: @scenery.id)
  end

  def edit
    @scenery = Scenery.find(params[:id])
  end

  def update
    scenery = Scenery.find(params[:id])
    scenery.update(scenery_params)
    results = Geocoder.search([scenery[:latitude],scenery[:longitude]])
    scenery[:place] = Scenery.get_adress(results)
    @prefecture = results.first.state
    scenery[:prefecture] = @prefecture
    scenery.save
    
    redirect_to scenery
  end

  def destroy
    scenery = Scenery.find(params[:id])
    scenery.delete

    redirect_to users_path
  end


  private

  def scenery_params
    params.require(:scenery).permit(:name, :title, :body, :prefecture, :image , :latitude, :longitude, :place, :parking_select, :parking_description, :category )
  end
end
