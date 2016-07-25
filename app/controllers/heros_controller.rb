class HerosController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def new
    @hero = Hero.new
  end
  
  def create
    @hero = Hero.new(hero_params)
    if @hero.save
      redirect_to login_path
    else
      render :new
    end
  end

  private

  def hero_params
    params.require(:hero).permit(:name, :password, :image_url)
  end
end
