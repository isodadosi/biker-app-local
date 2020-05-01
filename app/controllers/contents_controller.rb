class ContentsController < ApplicationController

  def index
    @sceneris = Scenery.order("id DESC").search(params[:search])
    @shops = Shop.order("id DESC").search(params[:search])

    @contents = (@sceneris+@shops).sort_by{|record| record.created_at}.reverse!


    @contents = Kaminari.paginate_array(@contents).page(params[:page])

  end

  def new
    @content = Content.new
  end

  def create
    content = Content.new(content_params)
    if content.save
      results = Geocoder.search([content[:latitude],content[:longitude]])
      content[:place] = Content.get_adress(results)
      @prefecture = results.first.state
      content[:prefecture] = @prefecture
      content.save
      redirect_to content
    else
      redirect_to new_content_path, flash: {
        error_messages: content.errors.full_messages
      }
    end
  end

  def show
    @content = Content.find(params[:id])
    @comment = Comment.new(content_id: @content.id)
  end

  def edit
    @content = Content.find(params[:id])
  end

  def update
    content = Content.find(params[:id])
    content.update(content_params)
    results = Geocoder.search([content[:latitude],content[:longitude]])
    content[:place] = Content.get_adress(results)
    @prefecture = results.first.state
    content[:prefecture] = @prefecture
    content.save
    
    redirect_to content
  end

  def destroy
    content = Content.find(params[:id])
    content.delete

    redirect_to users_path
  end


  private

  def content_params
    params.require(:content).permit(:name, :title, :body, :prefecture, :image , :latitude, :longitude, :place)
  end
end
