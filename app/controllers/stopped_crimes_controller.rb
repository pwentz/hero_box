class StoppedCrimesController < ApplicationController
  before_action :validate_hero

  def index
    @recent_power = current_hero.powers.last unless current_hero.powers.empty?
  end

  def show
    @stopped_crime = current_hero.stopped_crimes.find(params[:id])
  end

  private
  
  def validate_hero
    unless current_hero == Hero.find(params[:hero_id])
      render file: '/public/404' unless current_admin?
    end
  end
end
