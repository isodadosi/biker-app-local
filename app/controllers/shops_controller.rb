class ShopsController < ApplicationController
    
    def index
        @shops = Shop.order("id DESC").search(params[:search]).page(params[:page])
    end

  def new
    @shop = Shop.new
  end

  def create
    shop = Shop.new(shop_params)
    if shop.save
      results = Geocoder.search([shop[:latitude],shop[:longitude]])
      shop[:place] = Shop.get_adress(results)
      @prefecture = results.first.state
      shop[:prefecture] = @prefecture
      shop.save
      redirect_to shop
    else
      redirect_to new_shop_path, flash: {
        error_messages: shop.errors.full_messages
      }
    end
  end

  def show
    @shop = Shop.find(params[:id])
    # @comment = Comment.new(shop_id: @shop.id)
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    shop = Shop.find(params[:id])
    shop.update(shop_params)
    results = Geocoder.search([shop[:latitude],shop[:longitude]])
    shop[:place] = Shop.get_adress(results)
    @prefecture = results.first.state
    shop[:prefecture] = @prefecture
    shop.save
    
    redirect_to shop
  end

  def destroy
    shop = Shop.find(params[:id])
    shop.delete

    redirect_to users_path
  end


  private

  def shop_params
    params.require(:shop).permit(:name, :title, :body, :prefecture, :image , :latitude, :longitude, :place, :parking_select, :parking_description )
  end
end
