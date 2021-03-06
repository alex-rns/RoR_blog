class SessionsController < ApplicationController

  def new
  end

  def create
    author = Author.find_by(email: params[:email])
    if author && author.authenticate(params[:password])
      session[:author_id] = author.id
      redirect_to home_path, notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:author_id] = nil
    redirect_to home_path, notice: "Logged out!"
  end
end
