class SessionsController < ApplicationController

  skip_before_action :authenticate, only: [:new, :create]

  def new
  end

  def create
    respond_to do |format|
      user = User.find_by(email: session_params[:email].downcase)
      if user && user.authenticate(session_params[:password])
        log_in user
        format.html { redirect_to root_path, notice: 'Welcome to Tangle' }
        format.json { render status: :success }
      else
        flash[:danger] = 'Invalid User/Password combination'
        format.html { render :new }
        format.json { render status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
    respond_to do |format|
      if !logged_in?
        flash[:danger] = 'Invalid session'
        format.html { redirect_to  login_path }
        format.json { render status: :unprocessable_entity }
      else
        log_out
        flash[:success] = 'Session closed successfully'
        format.html { redirect_to login_path }
        format.json { render status: :success}
      end
    end
  end

  private

  def set_user
    @user = User.find_by(email: params[:email])
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end

  def log_in user
    session[:user_id] = user.id
  end

  def logged_in?
    !session[:user_id].nil?
  end

  def log_out
    session.delete :user_id
    @current_user = nil
  end

end
