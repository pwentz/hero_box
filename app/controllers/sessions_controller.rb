class SessionsController < ApplicationController
  def new
  end

  def create
    hero = Hero.find_by(:name => params[:session][:name])
    if hero && hero.authenticate(params[:session][:password])
      session[:hero_id] = hero.id
      flash[:success] = "Welcome #{hero.name}"
      redirect_to hero_path(hero)
    else
      flash[:danger] = "Invalid credentials"
      render :new
    end
  end
end
