class UsersController < ApplicationController

  def index
    if @current_user
      search_name = @current_user.name
    else
      search_name = "ゲスト"
    end
    @contents = Content.search_my_content(search_name).page(params[:page])
    @shops = Shop.search_my_content(search_name).page(params[:page])
  end

  def new
    @user = User.new(flash[:user])
  end

 def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to users_path
    else
      redirect_to new_user_path, flash: {
        user: user,
        error_messages: user.errors.full_messages
      }
    end
  end




  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
