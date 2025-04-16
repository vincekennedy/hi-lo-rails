class SessionsController < ApplicationController
    def new
    end
  
    def create
      user = User.find_by(email: params[:session][:email])
      if user&.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to courses_path
      else
        flash[:alert] = "Invalid email or password"
        render :new
      end
    end
  
    def destroy
      session[:user_id] = nil
      flash[:notice] = "You have been logged out."
      redirect_to login_path, notice: "Logged out!"
    end
  end
  