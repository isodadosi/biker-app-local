class ContentsController < ApplicationController

  def index
    @contents = Content.order("id DESC").search(params[:search]).page(params[:page])
  end

  def new
    @content = Content.new
  end

  def create
    content = Content.new(content_params)
    if content.save
      results = Geocoder.search([content[:latitude],content[:longitude]])
      content[:place] = Content.get_adress(results)
      content.save
      redirect_to content
    else
      redirect_to new_content_path
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
    params.require(:content).permit(:name, :title, :body, :prefecture, :image , :latitude, :longitude, :place )
  end
end
