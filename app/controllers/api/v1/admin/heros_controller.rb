class Api::V1::Admin::HerosController < Api::V1::BaseController
  skip_before_action :require_login
  def index
    respond_with Hero.where(role: 0)
  end

  def destroy
    respond_with destroy_hero
  end

  def update
    respond_with Hero.update(params[:id], hero_params)
  end

  private

  def hero_params
    params.require(:hero).permit(:name, :hometown, :id, :role)
  end

  def destroy_hero
    hero = Hero.find(params[:id])
    hero.stopped_crimes.destroy_all
    hero.hero_powers.destroy_all
    hero.destroy
  end
end
