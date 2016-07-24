class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def new
    redirect_to hero_stopped_crimes_path(current_hero) if current_hero
  end

  def create
    hero = Hero.find_by(:name => params[:session][:name])
    if hero && hero.authenticate(params[:session][:password])
      session[:hero_id] = hero.id
      flash[:success] = "Welcome #{hero.name}"
      redirect_to hero_stopped_crimes_path(hero)
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
