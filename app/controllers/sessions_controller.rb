class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to users_path
    else
      redirect_to new_session_path, flash: {
        notice: "一致するものが見当たりませんでした"
      }
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
