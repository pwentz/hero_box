class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def new
    if current_admin?
      redirect_to admin_heros_path
    elsif current_hero
      redirect_to hero_stopped_crimes_path(current_hero) 
    end
  end

  def create
    hero = Hero.find_by(:name => params[:session][:name])
    if hero && hero.authenticate(params[:session][:password])
      session[:hero_id] = hero.id
      flash[:success] = "Welcome #{hero.name}"
      redirect_to root_path
    else
      flash[:danger] = "Invalid credentials"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:success] = "Successfully logged out!"
    redirect_to root_path
  end
end
