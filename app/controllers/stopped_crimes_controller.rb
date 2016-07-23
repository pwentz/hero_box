class StoppedCrimesController < ApplicationController
  def index
    if current_hero
      @recent_power = current_hero.powers.last unless current_hero.powers.empty?
    else
      flash[:danger] = "You must be logged in first"
      render :login
    end
  end

  def show
    @stopped_crime = current_hero.stopped_crimes.find(params[:id])
  end
end
