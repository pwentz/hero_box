class Admin::HerosController < ApplicationController
  def show

  end

  def index
  end

  def new
    @hero = Hero.new
  end

  def create
    @hero = Hero.new(hero_params)
    @hero.password = params[:hero][:password]
    @hero.role = 0
    if @hero.save
      flash[:success] = "Hero created!"
      redirect_to admin_heros_path(current_hero)
    else
      flash[:danger] = "Invalid credentials"
      render :new
    end
  end

  private

  def hero_params
    params.require(:hero).permit(:name, :hometown, :password)
  end
end
